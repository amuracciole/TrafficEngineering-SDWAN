from ryu.base import app_manager
from ryu.controller import ofp_event
from ryu.controller.handler import CONFIG_DISPATCHER, DEAD_DISPATCHER
from ryu.controller.handler import MAIN_DISPATCHER, HANDSHAKE_DISPATCHER
from ryu.controller.handler import set_ev_cls
from ryu.ofproto import ofproto_v1_3
from ryu.ofproto import ether
from ryu.lib.packet import packet
from ryu.lib.packet import ethernet
from ryu.lib.packet import arp
from ryu.lib.packet import ipv4
from ryu.lib.packet import ipv6
from ryu import utils


class MULTIPATH_13(app_manager.RyuApp):
    OFP_VERSIONS = [ofproto_v1_3.OFP_VERSION]

    def __init__(self, *args, **kwargs):
        super(MULTIPATH_13, self).__init__(*args, **kwargs)
        self.mac_to_port = {}
        self.datapaths = {}
        self.FLAGS = True

    @set_ev_cls(ofp_event.EventOFPErrorMsg, [HANDSHAKE_DISPATCHER, CONFIG_DISPATCHER, MAIN_DISPATCHER])
    def error_msg_handler(self, ev):
        #print("error_msg_handler")
        msg = ev.msg
        self.logger.debug('OFPErrorMsg received: type=0x%02x code=0x%02x ' 'message=%s', msg.type, msg.code, utils.hex_array(msg.data))

#-------------------------OK-------------------------#
    @set_ev_cls(ofp_event.EventOFPStateChange, [MAIN_DISPATCHER, DEAD_DISPATCHER])
    def _state_change_handler(self, ev):
        """
            Collect datapath information.
        """
        #print("_state_change_handler")
        datapath = ev.datapath
        if ev.state == MAIN_DISPATCHER:
            if not datapath.id in self.datapaths:
                self.logger.debug('register datapath: %016x', datapath.id)
                self.datapaths[datapath.id] = datapath
        elif ev.state == DEAD_DISPATCHER:
            if datapath.id in self.datapaths:
                self.logger.debug('unregister datapath: %016x', datapath.id)
                del self.datapaths[datapath.id]
#----------------------------------------------------#
#-------------------------NO-------------------------#
    @set_ev_cls(ofp_event.EventOFPSwitchFeatures, CONFIG_DISPATCHER)
    def switch_features_handler(self, ev):
        #print("switch_features_handler")
        datapath = ev.msg.datapath
        dpid = datapath.id
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser

        # install table-miss flow entry
        match = parser.OFPMatch()
        actions = [parser.OFPActionOutput(ofproto.OFPP_CONTROLLER, ofproto.OFPCML_NO_BUFFER)]
        self.add_flow(datapath, 0, 0, match, actions)
        if (dpid == 2560):
            self.logger.info("--> CONM_A <--")
        if (dpid == 2816):
            self.logger.info("--> CONM_B <--")
        if (dpid == 3072):
            self.logger.info("--> CONM_C <--")
        if (dpid == 3328):
            self.logger.info("--> CONM_D <--")
        if (dpid == 3584):
            self.logger.info("--> CONM_E <--")
        self.logger.info("switch:%s connected", dpid)
        
#----------------------------------------------------#
#-------------------------OK-------------------------#
    def add_flow(self, datapath, hard_timeout, priority, match, actions):
        """
            Send a flow entry to datapath.
        """
        #print("add_flow")
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser

        inst = [parser.OFPInstructionActions(ofproto.OFPIT_APPLY_ACTIONS, actions)]

        mod = parser.OFPFlowMod(datapath=datapath, priority=priority, hard_timeout=hard_timeout, match=match, instructions=inst)
        datapath.send_msg(mod)
#----------------------------------------------------#
#-------------------------OK-------------------------#
    def _build_packet_out(self, datapath, buffer_id, src_port, dst_port, data):
        """
            Build packet out object.
        """
        #print("build_packet_out")
        actions = []
        if dst_port:
            actions.append(datapath.ofproto_parser.OFPActionOutput(dst_port))

        msg_data = None
        if buffer_id == datapath.ofproto.OFP_NO_BUFFER:
            if data is None:
                return None
            msg_data = data

        out = datapath.ofproto_parser.OFPPacketOut(
            datapath=datapath, buffer_id=buffer_id,
            data=msg_data, in_port=src_port, actions=actions)
        #print (out)
        return out
#----------------------------------------------------#
#-------------------------OK-------------------------#
    def send_packet_out(self, datapath, buffer_id, src_port, dst_port, data):
        """
            Send packet out packet to assigned datapath.
        """
        #print("send_packet_out")
        out = self._build_packet_out(datapath, buffer_id, src_port, dst_port, data)
        if out:
            datapath.send_msg(out)
#----------------------------------------------------#
#-------------------------OK-------------------------#
    def flood(self, msg):
        """
            Flood ARP packet to the access port
            which has no record of host.
        """
        #print("flood")
        datapath = msg.datapath
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser
        
        out = self._build_packet_out(datapath, ofproto.OFP_NO_BUFFER, ofproto.OFPP_CONTROLLER, ofproto.OFPP_FLOOD, msg.data)
        datapath.send_msg(out)
        self.logger.debug("Flooding msg")
#----------------------------------------------------#
#-------------------------OK-------------------------#
    def arp_forwarding(self, msg, src_ip, dst_ip, eth_pkt):
        """ Send ARP packet to the destination host,
            if the dst host record is existed,
            else, flow it to the unknow access port.
        """
        #print("arp_forwarding")
        datapath = msg.datapath
        parser = datapath.ofproto_parser
        in_port = msg.match['in_port']

        out_port = self.mac_to_port[datapath.id].get(eth_pkt.dst)
        if out_port is not None:
            match = parser.OFPMatch(in_port=in_port, eth_dst=eth_pkt.dst, eth_type=eth_pkt.ethertype)
            actions = [parser.OFPActionOutput(out_port)]
            self.add_flow(datapath, 0, 1, match, actions)
            self.send_packet_out(datapath, msg.buffer_id, in_port, out_port, msg.data)
            self.logger.debug("Reply ARP to knew host")
        else:
            self.flood(msg)
            print (msg)
#----------------------------------------------------#
#-------------------------NO-------------------------#
    def mac_learning(self, dpid, src_mac, in_port):
        #print("mac_learning")
        self.mac_to_port.setdefault(dpid, {})
        if src_mac in self.mac_to_port[dpid]:
            if in_port != self.mac_to_port[dpid][src_mac]:
                return False
        else:
            self.mac_to_port[dpid][src_mac] = in_port
            return True
#----------------------------------------------------#
#-------------------------NO-------------------------#
    def send_group_mod(self, datapath,):
        #print("send_group_mod")
        ofproto = datapath.ofproto
        ofp_parser = datapath.ofproto_parser

        port_1 = 3
        queue_1 = ofp_parser.OFPActionSetQueue(0)
        actions_1 = [queue_1, ofp_parser.OFPActionOutput(port_1)]

        port_2 = 2
        queue_2 = ofp_parser.OFPActionSetQueue(0)
        actions_2 = [queue_2, ofp_parser.OFPActionOutput(port_2)]

        weight_1 = 50
        weight_2 = 50

        watch_port = ofproto_v1_3.OFPP_ANY
        watch_group = ofproto_v1_3.OFPQ_ALL

        buckets = [
            ofp_parser.OFPBucket(weight_1, watch_port, watch_group, actions_1),
            ofp_parser.OFPBucket(weight_2, watch_port, watch_group, actions_2)]

        group_id = 50
        req = ofp_parser.OFPGroupMod(datapath, ofproto.OFPFC_ADD, ofproto.OFPGT_SELECT, group_id, buckets)

        datapath.send_msg(req)

    @set_ev_cls(ofp_event.EventOFPPacketIn, MAIN_DISPATCHER)
    def _packet_in_handler(self, ev):
        #print("packet_in_handler")
        msg = ev.msg
        datapath = msg.datapath
        dpid = datapath.id
        parser = datapath.ofproto_parser
        in_port = msg.match['in_port']

        pkt = packet.Packet(msg.data)
        eth = pkt.get_protocols(ethernet.ethernet)[0]
        arp_pkt = pkt.get_protocol(arp.arp)
        ip_pkt = pkt.get_protocol(ipv4.ipv4)

        ip_pkt_6 = pkt.get_protocol(ipv6.ipv6)
        if isinstance(ip_pkt_6, ipv6.ipv6):
            actions = []
            match = parser.OFPMatch(eth_type=ether.ETH_TYPE_IPV6)
            self.add_flow(datapath, 0, 1, match, actions)
            #print("ipv6")
            return

        if isinstance(arp_pkt, arp.arp):
            self.logger.debug("ARP processing")
            if self.mac_learning(dpid, eth.src, in_port) is False:
                self.logger.debug("ARP packet enter in different ports")
                return
            #print("ARP")
            self.arp_forwarding(msg, arp_pkt.src_ip, arp_pkt.dst_ip, eth)

        if isinstance(ip_pkt, ipv4.ipv4):
            #print("ipv4")
            self.logger.debug("IPV4 processing")
            mac_to_port_table = self.mac_to_port.get(dpid)
            if mac_to_port_table is None:
                self.logger.info("Dpid is not in mac_to_port")
                return

            out_port = None
            if eth.dst in mac_to_port_table:
                if dpid == 1 and in_port == 1:
                    if self.FLAGS is True:
                        self.send_group_mod(datapath)
                        self.logger.info("send_group_mod")
                        self.FLAGS = False

                    actions = [parser.OFPActionGroup(group_id=50)]
                    match = parser.OFPMatch(in_port=in_port, eth_type=eth.ethertype, ipv4_src=ip_pkt.src)
                    self.add_flow(datapath, 0, 3, match, actions)
                    # asign output at 2
                    self.send_packet_out(datapath, msg.buffer_id, in_port, 2, msg.data)
                else:
                    #Normal flows
                    out_port = mac_to_port_table[eth.dst]
                    actions = [parser.OFPActionOutput(out_port)]
                    match = parser.OFPMatch(in_port=in_port, eth_dst=eth.dst, eth_type=eth.ethertype)
                    self.add_flow(datapath, 0, 1, match, actions)
                    self.send_packet_out(datapath, msg.buffer_id, in_port, out_port, msg.data)
            else:
                if self.mac_learning(dpid, eth.src, in_port) is False:
                    self.logger.debug("IPV4 packet enter in different ports")
                    return
                else:
                    self.flood(msg)
#----------------------------------------------------#
