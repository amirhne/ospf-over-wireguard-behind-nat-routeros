/interface wireguard
add listen-port=13231 mtu=1420 name=wireguard1 private-key=\
    "UK5FVHf4mBwEmF8JgmvSkxo+XZtf9abe92jEH9fhMGk="
/interface wireguard peers
add allowed-address=0.0.0.0/0 endpoint-address=10.20.30.63 endpoint-port=\
    13231 wireguard1 public-key=\
    "x07ya7npDQIc3m8/Wus1eV+5fgPBF0c44OPENQ4oK3A="

/ip address
add address=192.168.4.2/30 comment=LTE_1 interface=ether1 network=\
    192.168.4.0
add address=172.17.0.1/30 comment=wireguard1 interface=wireguard1 network=\
    172.17.0.0

/ip route
add disabled=no dst-address=10.20.30.63/32 gateway=192.168.4.1 \
    routing-table=main suppress-hw-offload=no

/routing id
add disabled=no id=10.20.30.50 name=APN_OSPF_1 select-dynamic-id=""


/routing ospf instance
add disabled=no name=APN_OSPF_1 redistribute=connected router-id=APN_OSPF_1
/routing ospf area
add disabled=no instance=APN_OSPF_1 name=APN_OSPF_1_0
/routing ospf interface-template
add area=APN_OSPF_1_0 disabled=no interfaces=wireguard1 networks=\
    172.17.0.0/30 type=nbma
/routing ospf static-neighbor
add address=172.17.0.2%wireguard1 area=APN_OSPF_1_0 disabled=no
