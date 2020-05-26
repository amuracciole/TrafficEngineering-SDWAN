#Script para enviar el trafico TCP/SSH por el camino largo
curl -X POST -d '{
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "tcp_dst": 22,
        "ip_proto": 6,
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 2
        }
    ]
 }' http://localhost:8080/stats/flowentry/add

curl -X POST -d '{
    "dpid": 2816,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "tcp_dst": 22,
        "ip_proto": 6,
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 2
        }
    ]
 }' http://localhost:8080/stats/flowentry/add

curl -X POST -d '{
    "dpid": 3328,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "tcp_dst": 22,
        "ip_proto": 6,
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 2
        }
    ]
 }' http://localhost:8080/stats/flowentry/add

curl -X POST -d '{
    "dpid": 3584,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "tcp_dst": 22,
        "ip_proto": 6,
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 3
        }
    ]
 }' http://localhost:8080/stats/flowentry/add

