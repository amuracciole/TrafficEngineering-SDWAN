#Eliminar flujo IP en CONM_B
curl -X POST -d '{
    "dpid": 3584,
    "cookie": 0,
    "cookie_mask": 1,
    "table_id": 0,
    "priority": 10,
    "flags": 1,
    "match":{
        "in_port": '$3',
        "ipv4_src": '"'$1'"',
        "ipv4_dst": '"'$2'"',
        "eth_type": 2048
    },
    "actions":[
        {
            "type":"OUTPUT",
            "port": '$4'
        }
    ]
 }' http://localhost:8080/stats/flowentry/delete_strict


