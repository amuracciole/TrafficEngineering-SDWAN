curl -X POST -d '{
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 3,
        "tcp_dst": '$1',
        "ip_proto": 6,
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 1
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 1,
        "tcp_dst": '$1',
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
        "in_port": 2,
        "tcp_dst": '$1',
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
curl -X POST -d '{
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 1,
        "tcp_src": '$1',
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
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 2,
        "tcp_src": '$1',
        "ip_proto": 6,
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 1
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
        "in_port": 3,
        "tcp_src": '$1',
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
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 1,
        "tcp_dst": '$1',
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
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 2,
        "tcp_dst": '$1',
        "ip_proto": 6,
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 1
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
        "in_port": 3,
        "tcp_dst": '$1',
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
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 3,
        "tcp_src": '$1',
        "ip_proto": 6,
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 1
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 1,
        "tcp_src": '$1',
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
        "in_port": 2,
        "tcp_src": '$1',
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
curl -X POST -d '{
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 3,
        "tcp_dst": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 1
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 1,
        "tcp_dst": '$1',
        "ip_proto": 6,
        "eth_type": 34525
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
        "in_port": 2,
        "tcp_dst": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 3
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 1,
        "tcp_src": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 3
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 2,
        "tcp_src": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 1
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
        "in_port": 3,
        "tcp_src": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 2
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 1,
        "tcp_dst": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 3
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 2,
        "tcp_dst": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 1
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
        "in_port": 3,
        "tcp_dst": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 2
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 3,
        "tcp_src": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 1
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 5,
    "flags": 1,
    "match":{
        "in_port": 1,
        "tcp_src": '$1',
        "ip_proto": 6,
        "eth_type": 34525
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
        "in_port": 2,
        "tcp_src": '$1',
        "ip_proto": 6,
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": 3
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
