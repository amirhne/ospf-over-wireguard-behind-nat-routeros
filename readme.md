## **OSPF Over WireGuard Behind NAT in RouterOS 7**

This is a RouterOS .rsc configuration sample for the topology depicted in the provided image. The scenario involves running a single area OSPF over a WireGuard site-to-site tunnel. In this particular setup, the service offered by the Private APN Provider is not directly reachable on the edge routers. Therefore, LTE devices perform source and destination NAT for traffic destined to the edge routers.

## Scenario
There are two LTE devices in my setup, LHG LTE Kits, labeled as LTE_1 and LTE_2. Additionally, there are two MikroTik routers, RB4011 and RB951, labeled as HQ and BR1. The LTE devices receive private IP ranges automatically assigned by the private APN provider. This configuration has been tested on RouterOS 7.9.

![](https://github.com/amirhne/ospf-over-wireguard-behind-nat-routeros/blob/main/scenario.png)

