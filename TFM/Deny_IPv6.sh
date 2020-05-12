#Descartar IPv6, CONM_A
curl -X POST -d '{
    "dpid": 2560,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 1,
    "flags": 1,
    "match":{
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"DROP"
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
#Descartar IPv6, CONM_B
curl -X POST -d '{
    "dpid": 2816,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 1,
    "flags": 1,
    "match":{
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"DROP"
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
#Descartar IPv6, CONM_C
curl -X POST -d '{
    "dpid": 3072,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 1,
    "flags": 1,
    "match":{
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"DROP"
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
#Descartar IPv6, CONM_D
curl -X POST -d '{
    "dpid": 3328,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 1,
    "flags": 1,
    "match":{
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"DROP"
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
#Descartar IPv6, CONM_A
curl -X POST -d '{
    "dpid": 3584,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 1,
    "flags": 1,
    "match":{
        "eth_type": 34525
    },
    "actions":[
        {
            "type":"DROP"
        }
    ]
 }' http://localhost:8080/stats/flowentry/add
