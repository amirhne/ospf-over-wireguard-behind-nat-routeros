/ip address
add address=192.168.4.1/30 interface=ether1 network=192.168.4.0

/ip firewall nat
add action=dst-nat chain=dstnat comment="Access SNMP of LTE" dst-address=\
    10.20.30.50 dst-port=161,162 protocol=udp src-address=\
    10.20.30.63 to-addresses=192.168.4.1
add action=dst-nat chain=dstnat comment="Access Winbox and SSH LTE" \
    dst-address=10.20.30.50 dst-port=8291,22 protocol=tcp src-address=\
    10.20.30.63 to-addresses=192.168.4.1
add action=masquerade chain=srcnat comment="Access LTE_2" src-address=\
    192.168.4.2
add action=dst-nat chain=dstnat comment="Forward Traffic to HQ" \
    dst-address=10.20.30.50 src-address=10.20.30.63 to-addresses=\
    192.168.4.2
