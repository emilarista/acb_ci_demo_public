# DC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [ISIS CLNS interfaces](#isis-clns-interfaces)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| DC1 | l3leaf | dc1-el1 | 192.168.0.24/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-el2 | 192.168.0.25/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-el3 | 192.168.0.26/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l1a | 192.168.0.14/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l1b | 192.168.0.15/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l2a | 192.168.0.16/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l2b | 192.168.0.17/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l3a | 192.168.0.18/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l3b | 192.168.0.19/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l4a | 192.168.0.20/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l4b | 192.168.0.21/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l5a | 192.168.0.22/24 | vEOS-lab | Provisioned | - |
| DC1 | l3leaf | dc1-l5b | 192.168.0.23/24 | vEOS-lab | Provisioned | - |
| DC1 | spine | dc1-sp1 | 192.168.0.10/24 | vEOS-lab | Provisioned | - |
| DC1 | spine | dc1-sp2 | 192.168.0.11/24 | vEOS-lab | Provisioned | - |
| DC1 | spine | dc1-sp3 | 192.168.0.13/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-el1 | 192.168.0.40/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-el2 | 192.168.0.41/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-el3 | 192.168.0.42/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l1a | 192.168.0.30/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l1b | 192.168.0.31/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l2a | 192.168.0.32/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l2b | 192.168.0.33/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l3a | 192.168.0.34/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l3b | 192.168.0.35/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l4a | 192.168.0.36/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l4b | 192.168.0.37/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l5a | 192.168.0.38/24 | vEOS-lab | Provisioned | - |
| DC2 | l3leaf | dc2-l5b | 192.168.0.39/24 | vEOS-lab | Provisioned | - |
| DC2 | spine | dc2-sp1 | 192.168.0.27/24 | vEOS-lab | Provisioned | - |
| DC2 | spine | dc2-sp2 | 192.168.0.28/24 | vEOS-lab | Provisioned | - |
| DC2 | spine | dc2-sp3 | 192.168.0.29/24 | vEOS-lab | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | dc1-el1 | Ethernet1 | spine | dc1-sp1 | Ethernet11 |
| l3leaf | dc1-el1 | Ethernet2 | spine | dc1-sp2 | Ethernet11 |
| l3leaf | dc1-el1 | Ethernet3 | spine | dc1-sp3 | Ethernet11 |
| l3leaf | dc1-el2 | Ethernet1 | spine | dc1-sp1 | Ethernet12 |
| l3leaf | dc1-el2 | Ethernet2 | spine | dc1-sp2 | Ethernet12 |
| l3leaf | dc1-el2 | Ethernet3 | spine | dc1-sp3 | Ethernet12 |
| l3leaf | dc1-el3 | Ethernet1 | spine | dc1-sp1 | Ethernet13 |
| l3leaf | dc1-el3 | Ethernet2 | spine | dc1-sp2 | Ethernet13 |
| l3leaf | dc1-el3 | Ethernet3 | spine | dc1-sp3 | Ethernet13 |
| l3leaf | dc1-l1a | Ethernet1 | spine | dc1-sp1 | Ethernet1 |
| l3leaf | dc1-l1a | Ethernet2 | spine | dc1-sp2 | Ethernet1 |
| l3leaf | dc1-l1a | Ethernet3 | spine | dc1-sp3 | Ethernet1 |
| l3leaf | dc1-l1a | Ethernet4 | mlag_peer | dc1-l1b | Ethernet4 |
| l3leaf | dc1-l1a | Ethernet5 | mlag_peer | dc1-l1b | Ethernet5 |
| l3leaf | dc1-l1b | Ethernet1 | spine | dc1-sp1 | Ethernet2 |
| l3leaf | dc1-l1b | Ethernet2 | spine | dc1-sp2 | Ethernet2 |
| l3leaf | dc1-l1b | Ethernet3 | spine | dc1-sp3 | Ethernet2 |
| l3leaf | dc1-l2a | Ethernet1 | spine | dc1-sp1 | Ethernet3 |
| l3leaf | dc1-l2a | Ethernet2 | spine | dc1-sp2 | Ethernet3 |
| l3leaf | dc1-l2a | Ethernet3 | spine | dc1-sp3 | Ethernet3 |
| l3leaf | dc1-l2a | Ethernet4 | mlag_peer | dc1-l2b | Ethernet4 |
| l3leaf | dc1-l2a | Ethernet5 | mlag_peer | dc1-l2b | Ethernet5 |
| l3leaf | dc1-l2b | Ethernet1 | spine | dc1-sp1 | Ethernet4 |
| l3leaf | dc1-l2b | Ethernet2 | spine | dc1-sp2 | Ethernet4 |
| l3leaf | dc1-l2b | Ethernet3 | spine | dc1-sp3 | Ethernet4 |
| l3leaf | dc1-l3a | Ethernet1 | spine | dc1-sp1 | Ethernet5 |
| l3leaf | dc1-l3a | Ethernet2 | spine | dc1-sp2 | Ethernet5 |
| l3leaf | dc1-l3a | Ethernet3 | spine | dc1-sp3 | Ethernet5 |
| l3leaf | dc1-l3a | Ethernet4 | mlag_peer | dc1-l3b | Ethernet4 |
| l3leaf | dc1-l3a | Ethernet5 | mlag_peer | dc1-l3b | Ethernet5 |
| l3leaf | dc1-l3b | Ethernet1 | spine | dc1-sp1 | Ethernet6 |
| l3leaf | dc1-l3b | Ethernet2 | spine | dc1-sp2 | Ethernet6 |
| l3leaf | dc1-l3b | Ethernet3 | spine | dc1-sp3 | Ethernet6 |
| l3leaf | dc1-l4a | Ethernet1 | spine | dc1-sp1 | Ethernet7 |
| l3leaf | dc1-l4a | Ethernet2 | spine | dc1-sp2 | Ethernet7 |
| l3leaf | dc1-l4a | Ethernet3 | spine | dc1-sp3 | Ethernet7 |
| l3leaf | dc1-l4a | Ethernet4 | mlag_peer | dc1-l4b | Ethernet4 |
| l3leaf | dc1-l4a | Ethernet5 | mlag_peer | dc1-l4b | Ethernet5 |
| l3leaf | dc1-l4b | Ethernet1 | spine | dc1-sp1 | Ethernet8 |
| l3leaf | dc1-l4b | Ethernet2 | spine | dc1-sp2 | Ethernet8 |
| l3leaf | dc1-l4b | Ethernet3 | spine | dc1-sp3 | Ethernet8 |
| l3leaf | dc1-l5a | Ethernet1 | spine | dc1-sp1 | Ethernet9 |
| l3leaf | dc1-l5a | Ethernet2 | spine | dc1-sp2 | Ethernet9 |
| l3leaf | dc1-l5a | Ethernet3 | spine | dc1-sp3 | Ethernet9 |
| l3leaf | dc1-l5a | Ethernet4 | mlag_peer | dc1-l5b | Ethernet4 |
| l3leaf | dc1-l5a | Ethernet5 | mlag_peer | dc1-l5b | Ethernet5 |
| l3leaf | dc1-l5b | Ethernet1 | spine | dc1-sp1 | Ethernet10 |
| l3leaf | dc1-l5b | Ethernet2 | spine | dc1-sp2 | Ethernet10 |
| l3leaf | dc1-l5b | Ethernet3 | spine | dc1-sp3 | Ethernet10 |
| l3leaf | dc2-el1 | Ethernet1 | spine | dc2-sp1 | Ethernet11 |
| l3leaf | dc2-el1 | Ethernet2 | spine | dc2-sp2 | Ethernet11 |
| l3leaf | dc2-el1 | Ethernet3 | spine | dc2-sp3 | Ethernet11 |
| l3leaf | dc2-el2 | Ethernet1 | spine | dc2-sp1 | Ethernet12 |
| l3leaf | dc2-el2 | Ethernet2 | spine | dc2-sp2 | Ethernet12 |
| l3leaf | dc2-el2 | Ethernet3 | spine | dc2-sp3 | Ethernet12 |
| l3leaf | dc2-el3 | Ethernet1 | spine | dc2-sp1 | Ethernet13 |
| l3leaf | dc2-el3 | Ethernet2 | spine | dc2-sp2 | Ethernet13 |
| l3leaf | dc2-el3 | Ethernet3 | spine | dc2-sp3 | Ethernet13 |
| l3leaf | dc2-l1a | Ethernet1 | spine | dc2-sp1 | Ethernet1 |
| l3leaf | dc2-l1a | Ethernet2 | spine | dc2-sp2 | Ethernet1 |
| l3leaf | dc2-l1a | Ethernet3 | spine | dc2-sp3 | Ethernet1 |
| l3leaf | dc2-l1a | Ethernet4 | mlag_peer | dc2-l1b | Ethernet4 |
| l3leaf | dc2-l1a | Ethernet5 | mlag_peer | dc2-l1b | Ethernet5 |
| l3leaf | dc2-l1b | Ethernet1 | spine | dc2-sp1 | Ethernet2 |
| l3leaf | dc2-l1b | Ethernet2 | spine | dc2-sp2 | Ethernet2 |
| l3leaf | dc2-l1b | Ethernet3 | spine | dc2-sp3 | Ethernet2 |
| l3leaf | dc2-l2a | Ethernet1 | spine | dc2-sp1 | Ethernet3 |
| l3leaf | dc2-l2a | Ethernet2 | spine | dc2-sp2 | Ethernet3 |
| l3leaf | dc2-l2a | Ethernet3 | spine | dc2-sp3 | Ethernet3 |
| l3leaf | dc2-l2a | Ethernet4 | mlag_peer | dc2-l2b | Ethernet4 |
| l3leaf | dc2-l2a | Ethernet5 | mlag_peer | dc2-l2b | Ethernet5 |
| l3leaf | dc2-l2b | Ethernet1 | spine | dc2-sp1 | Ethernet4 |
| l3leaf | dc2-l2b | Ethernet2 | spine | dc2-sp2 | Ethernet4 |
| l3leaf | dc2-l2b | Ethernet3 | spine | dc2-sp3 | Ethernet4 |
| l3leaf | dc2-l3a | Ethernet1 | spine | dc2-sp1 | Ethernet5 |
| l3leaf | dc2-l3a | Ethernet2 | spine | dc2-sp2 | Ethernet5 |
| l3leaf | dc2-l3a | Ethernet3 | spine | dc2-sp3 | Ethernet5 |
| l3leaf | dc2-l3a | Ethernet4 | mlag_peer | dc2-l3b | Ethernet4 |
| l3leaf | dc2-l3a | Ethernet5 | mlag_peer | dc2-l3b | Ethernet5 |
| l3leaf | dc2-l3b | Ethernet1 | spine | dc2-sp1 | Ethernet6 |
| l3leaf | dc2-l3b | Ethernet2 | spine | dc2-sp2 | Ethernet6 |
| l3leaf | dc2-l3b | Ethernet3 | spine | dc2-sp3 | Ethernet6 |
| l3leaf | dc2-l4a | Ethernet1 | spine | dc2-sp1 | Ethernet7 |
| l3leaf | dc2-l4a | Ethernet2 | spine | dc2-sp2 | Ethernet7 |
| l3leaf | dc2-l4a | Ethernet3 | spine | dc2-sp3 | Ethernet7 |
| l3leaf | dc2-l4a | Ethernet4 | mlag_peer | dc2-l4b | Ethernet4 |
| l3leaf | dc2-l4a | Ethernet5 | mlag_peer | dc2-l4b | Ethernet5 |
| l3leaf | dc2-l4b | Ethernet1 | spine | dc2-sp1 | Ethernet8 |
| l3leaf | dc2-l4b | Ethernet2 | spine | dc2-sp2 | Ethernet8 |
| l3leaf | dc2-l4b | Ethernet3 | spine | dc2-sp3 | Ethernet8 |
| l3leaf | dc2-l5a | Ethernet1 | spine | dc2-sp1 | Ethernet9 |
| l3leaf | dc2-l5a | Ethernet2 | spine | dc2-sp2 | Ethernet9 |
| l3leaf | dc2-l5a | Ethernet3 | spine | dc2-sp3 | Ethernet9 |
| l3leaf | dc2-l5a | Ethernet4 | mlag_peer | dc2-l5b | Ethernet4 |
| l3leaf | dc2-l5a | Ethernet5 | mlag_peer | dc2-l5b | Ethernet5 |
| l3leaf | dc2-l5b | Ethernet1 | spine | dc2-sp1 | Ethernet10 |
| l3leaf | dc2-l5b | Ethernet2 | spine | dc2-sp2 | Ethernet10 |
| l3leaf | dc2-l5b | Ethernet3 | spine | dc2-sp3 | Ethernet10 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 100.64.1.0/24 | 256 | 78 | 30.47 % |
| 100.66.1.0/24 | 256 | 78 | 30.47 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| dc1-el1 | Ethernet1 | 100.64.1.61/31 | dc1-sp1 | Ethernet11 | 100.64.1.60/31 |
| dc1-el1 | Ethernet2 | 100.64.1.63/31 | dc1-sp2 | Ethernet11 | 100.64.1.62/31 |
| dc1-el1 | Ethernet3 | 100.64.1.65/31 | dc1-sp3 | Ethernet11 | 100.64.1.64/31 |
| dc1-el2 | Ethernet1 | 100.64.1.67/31 | dc1-sp1 | Ethernet12 | 100.64.1.66/31 |
| dc1-el2 | Ethernet2 | 100.64.1.69/31 | dc1-sp2 | Ethernet12 | 100.64.1.68/31 |
| dc1-el2 | Ethernet3 | 100.64.1.71/31 | dc1-sp3 | Ethernet12 | 100.64.1.70/31 |
| dc1-el3 | Ethernet1 | 100.64.1.73/31 | dc1-sp1 | Ethernet13 | 100.64.1.72/31 |
| dc1-el3 | Ethernet2 | 100.64.1.75/31 | dc1-sp2 | Ethernet13 | 100.64.1.74/31 |
| dc1-el3 | Ethernet3 | 100.64.1.77/31 | dc1-sp3 | Ethernet13 | 100.64.1.76/31 |
| dc1-l1a | Ethernet1 | 100.64.1.1/31 | dc1-sp1 | Ethernet1 | 100.64.1.0/31 |
| dc1-l1a | Ethernet2 | 100.64.1.3/31 | dc1-sp2 | Ethernet1 | 100.64.1.2/31 |
| dc1-l1a | Ethernet3 | 100.64.1.5/31 | dc1-sp3 | Ethernet1 | 100.64.1.4/31 |
| dc1-l1b | Ethernet1 | 100.64.1.7/31 | dc1-sp1 | Ethernet2 | 100.64.1.6/31 |
| dc1-l1b | Ethernet2 | 100.64.1.9/31 | dc1-sp2 | Ethernet2 | 100.64.1.8/31 |
| dc1-l1b | Ethernet3 | 100.64.1.11/31 | dc1-sp3 | Ethernet2 | 100.64.1.10/31 |
| dc1-l2a | Ethernet1 | 100.64.1.13/31 | dc1-sp1 | Ethernet3 | 100.64.1.12/31 |
| dc1-l2a | Ethernet2 | 100.64.1.15/31 | dc1-sp2 | Ethernet3 | 100.64.1.14/31 |
| dc1-l2a | Ethernet3 | 100.64.1.17/31 | dc1-sp3 | Ethernet3 | 100.64.1.16/31 |
| dc1-l2b | Ethernet1 | 100.64.1.19/31 | dc1-sp1 | Ethernet4 | 100.64.1.18/31 |
| dc1-l2b | Ethernet2 | 100.64.1.21/31 | dc1-sp2 | Ethernet4 | 100.64.1.20/31 |
| dc1-l2b | Ethernet3 | 100.64.1.23/31 | dc1-sp3 | Ethernet4 | 100.64.1.22/31 |
| dc1-l3a | Ethernet1 | 100.64.1.25/31 | dc1-sp1 | Ethernet5 | 100.64.1.24/31 |
| dc1-l3a | Ethernet2 | 100.64.1.27/31 | dc1-sp2 | Ethernet5 | 100.64.1.26/31 |
| dc1-l3a | Ethernet3 | 100.64.1.29/31 | dc1-sp3 | Ethernet5 | 100.64.1.28/31 |
| dc1-l3b | Ethernet1 | 100.64.1.31/31 | dc1-sp1 | Ethernet6 | 100.64.1.30/31 |
| dc1-l3b | Ethernet2 | 100.64.1.33/31 | dc1-sp2 | Ethernet6 | 100.64.1.32/31 |
| dc1-l3b | Ethernet3 | 100.64.1.35/31 | dc1-sp3 | Ethernet6 | 100.64.1.34/31 |
| dc1-l4a | Ethernet1 | 100.64.1.37/31 | dc1-sp1 | Ethernet7 | 100.64.1.36/31 |
| dc1-l4a | Ethernet2 | 100.64.1.39/31 | dc1-sp2 | Ethernet7 | 100.64.1.38/31 |
| dc1-l4a | Ethernet3 | 100.64.1.41/31 | dc1-sp3 | Ethernet7 | 100.64.1.40/31 |
| dc1-l4b | Ethernet1 | 100.64.1.43/31 | dc1-sp1 | Ethernet8 | 100.64.1.42/31 |
| dc1-l4b | Ethernet2 | 100.64.1.45/31 | dc1-sp2 | Ethernet8 | 100.64.1.44/31 |
| dc1-l4b | Ethernet3 | 100.64.1.47/31 | dc1-sp3 | Ethernet8 | 100.64.1.46/31 |
| dc1-l5a | Ethernet1 | 100.64.1.49/31 | dc1-sp1 | Ethernet9 | 100.64.1.48/31 |
| dc1-l5a | Ethernet2 | 100.64.1.51/31 | dc1-sp2 | Ethernet9 | 100.64.1.50/31 |
| dc1-l5a | Ethernet3 | 100.64.1.53/31 | dc1-sp3 | Ethernet9 | 100.64.1.52/31 |
| dc1-l5b | Ethernet1 | 100.64.1.55/31 | dc1-sp1 | Ethernet10 | 100.64.1.54/31 |
| dc1-l5b | Ethernet2 | 100.64.1.57/31 | dc1-sp2 | Ethernet10 | 100.64.1.56/31 |
| dc1-l5b | Ethernet3 | 100.64.1.59/31 | dc1-sp3 | Ethernet10 | 100.64.1.58/31 |
| dc2-el1 | Ethernet1 | 100.66.1.61/31 | dc2-sp1 | Ethernet11 | 100.66.1.60/31 |
| dc2-el1 | Ethernet2 | 100.66.1.63/31 | dc2-sp2 | Ethernet11 | 100.66.1.62/31 |
| dc2-el1 | Ethernet3 | 100.66.1.65/31 | dc2-sp3 | Ethernet11 | 100.66.1.64/31 |
| dc2-el2 | Ethernet1 | 100.66.1.67/31 | dc2-sp1 | Ethernet12 | 100.66.1.66/31 |
| dc2-el2 | Ethernet2 | 100.66.1.69/31 | dc2-sp2 | Ethernet12 | 100.66.1.68/31 |
| dc2-el2 | Ethernet3 | 100.66.1.71/31 | dc2-sp3 | Ethernet12 | 100.66.1.70/31 |
| dc2-el3 | Ethernet1 | 100.66.1.73/31 | dc2-sp1 | Ethernet13 | 100.66.1.72/31 |
| dc2-el3 | Ethernet2 | 100.66.1.75/31 | dc2-sp2 | Ethernet13 | 100.66.1.74/31 |
| dc2-el3 | Ethernet3 | 100.66.1.77/31 | dc2-sp3 | Ethernet13 | 100.66.1.76/31 |
| dc2-l1a | Ethernet1 | 100.66.1.1/31 | dc2-sp1 | Ethernet1 | 100.66.1.0/31 |
| dc2-l1a | Ethernet2 | 100.66.1.3/31 | dc2-sp2 | Ethernet1 | 100.66.1.2/31 |
| dc2-l1a | Ethernet3 | 100.66.1.5/31 | dc2-sp3 | Ethernet1 | 100.66.1.4/31 |
| dc2-l1b | Ethernet1 | 100.66.1.7/31 | dc2-sp1 | Ethernet2 | 100.66.1.6/31 |
| dc2-l1b | Ethernet2 | 100.66.1.9/31 | dc2-sp2 | Ethernet2 | 100.66.1.8/31 |
| dc2-l1b | Ethernet3 | 100.66.1.11/31 | dc2-sp3 | Ethernet2 | 100.66.1.10/31 |
| dc2-l2a | Ethernet1 | 100.66.1.13/31 | dc2-sp1 | Ethernet3 | 100.66.1.12/31 |
| dc2-l2a | Ethernet2 | 100.66.1.15/31 | dc2-sp2 | Ethernet3 | 100.66.1.14/31 |
| dc2-l2a | Ethernet3 | 100.66.1.17/31 | dc2-sp3 | Ethernet3 | 100.66.1.16/31 |
| dc2-l2b | Ethernet1 | 100.66.1.19/31 | dc2-sp1 | Ethernet4 | 100.66.1.18/31 |
| dc2-l2b | Ethernet2 | 100.66.1.21/31 | dc2-sp2 | Ethernet4 | 100.66.1.20/31 |
| dc2-l2b | Ethernet3 | 100.66.1.23/31 | dc2-sp3 | Ethernet4 | 100.66.1.22/31 |
| dc2-l3a | Ethernet1 | 100.66.1.25/31 | dc2-sp1 | Ethernet5 | 100.66.1.24/31 |
| dc2-l3a | Ethernet2 | 100.66.1.27/31 | dc2-sp2 | Ethernet5 | 100.66.1.26/31 |
| dc2-l3a | Ethernet3 | 100.66.1.29/31 | dc2-sp3 | Ethernet5 | 100.66.1.28/31 |
| dc2-l3b | Ethernet1 | 100.66.1.31/31 | dc2-sp1 | Ethernet6 | 100.66.1.30/31 |
| dc2-l3b | Ethernet2 | 100.66.1.33/31 | dc2-sp2 | Ethernet6 | 100.66.1.32/31 |
| dc2-l3b | Ethernet3 | 100.66.1.35/31 | dc2-sp3 | Ethernet6 | 100.66.1.34/31 |
| dc2-l4a | Ethernet1 | 100.66.1.37/31 | dc2-sp1 | Ethernet7 | 100.66.1.36/31 |
| dc2-l4a | Ethernet2 | 100.66.1.39/31 | dc2-sp2 | Ethernet7 | 100.66.1.38/31 |
| dc2-l4a | Ethernet3 | 100.66.1.41/31 | dc2-sp3 | Ethernet7 | 100.66.1.40/31 |
| dc2-l4b | Ethernet1 | 100.66.1.43/31 | dc2-sp1 | Ethernet8 | 100.66.1.42/31 |
| dc2-l4b | Ethernet2 | 100.66.1.45/31 | dc2-sp2 | Ethernet8 | 100.66.1.44/31 |
| dc2-l4b | Ethernet3 | 100.66.1.47/31 | dc2-sp3 | Ethernet8 | 100.66.1.46/31 |
| dc2-l5a | Ethernet1 | 100.66.1.49/31 | dc2-sp1 | Ethernet9 | 100.66.1.48/31 |
| dc2-l5a | Ethernet2 | 100.66.1.51/31 | dc2-sp2 | Ethernet9 | 100.66.1.50/31 |
| dc2-l5a | Ethernet3 | 100.66.1.53/31 | dc2-sp3 | Ethernet9 | 100.66.1.52/31 |
| dc2-l5b | Ethernet1 | 100.66.1.55/31 | dc2-sp1 | Ethernet10 | 100.66.1.54/31 |
| dc2-l5b | Ethernet2 | 100.66.1.57/31 | dc2-sp2 | Ethernet10 | 100.66.1.56/31 |
| dc2-l5b | Ethernet3 | 100.66.1.59/31 | dc2-sp3 | Ethernet10 | 100.66.1.58/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 100.64.2.0/24 | 256 | 16 | 6.25 % |
| 100.66.2.0/24 | 256 | 16 | 6.25 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC1 | dc1-el1 | 100.64.2.21/32 |
| DC1 | dc1-el2 | 100.64.2.22/32 |
| DC1 | dc1-el3 | 100.64.2.23/32 |
| DC1 | dc1-l1a | 100.64.2.11/32 |
| DC1 | dc1-l1b | 100.64.2.12/32 |
| DC1 | dc1-l2a | 100.64.2.13/32 |
| DC1 | dc1-l2b | 100.64.2.14/32 |
| DC1 | dc1-l3a | 100.64.2.15/32 |
| DC1 | dc1-l3b | 100.64.2.16/32 |
| DC1 | dc1-l4a | 100.64.2.17/32 |
| DC1 | dc1-l4b | 100.64.2.18/32 |
| DC1 | dc1-l5a | 100.64.2.19/32 |
| DC1 | dc1-l5b | 100.64.2.20/32 |
| DC1 | dc1-sp1 | 100.64.2.1/32 |
| DC1 | dc1-sp2 | 100.64.2.2/32 |
| DC1 | dc1-sp3 | 100.64.2.3/32 |
| DC2 | dc2-el1 | 100.66.2.21/32 |
| DC2 | dc2-el2 | 100.66.2.22/32 |
| DC2 | dc2-el3 | 100.66.2.23/32 |
| DC2 | dc2-l1a | 100.66.2.11/32 |
| DC2 | dc2-l1b | 100.66.2.12/32 |
| DC2 | dc2-l2a | 100.66.2.13/32 |
| DC2 | dc2-l2b | 100.66.2.14/32 |
| DC2 | dc2-l3a | 100.66.2.15/32 |
| DC2 | dc2-l3b | 100.66.2.16/32 |
| DC2 | dc2-l4a | 100.66.2.17/32 |
| DC2 | dc2-l4b | 100.66.2.18/32 |
| DC2 | dc2-l5a | 100.66.2.19/32 |
| DC2 | dc2-l5b | 100.66.2.20/32 |
| DC2 | dc2-sp1 | 100.66.2.1/32 |
| DC2 | dc2-sp2 | 100.66.2.2/32 |
| DC2 | dc2-sp3 | 100.66.2.3/32 |

### ISIS CLNS interfaces

| POD | Node | CLNS Address |
| --- | ---- | ------------ |
| DC1 | dc1-el1 | 49.0001.0000.0002.0011.00 |
| DC1 | dc1-el2 | 49.0001.0000.0002.0012.00 |
| DC1 | dc1-el3 | 49.0001.0000.0002.0013.00 |
| DC1 | dc1-l1a | 49.0001.0000.0002.0001.00 |
| DC1 | dc1-l1b | 49.0001.0000.0002.0002.00 |
| DC1 | dc1-l2a | 49.0001.0000.0002.0003.00 |
| DC1 | dc1-l2b | 49.0001.0000.0002.0004.00 |
| DC1 | dc1-l3a | 49.0001.0000.0002.0005.00 |
| DC1 | dc1-l3b | 49.0001.0000.0002.0006.00 |
| DC1 | dc1-l4a | 49.0001.0000.0002.0007.00 |
| DC1 | dc1-l4b | 49.0001.0000.0002.0008.00 |
| DC1 | dc1-l5a | 49.0001.0000.0002.0009.00 |
| DC1 | dc1-l5b | 49.0001.0000.0002.0010.00 |
| DC1 | dc1-sp1 | 49.0001.0000.0001.0001.00 |
| DC1 | dc1-sp2 | 49.0001.0000.0001.0002.00 |
| DC1 | dc1-sp3 | 49.0001.0000.0001.0003.00 |
| DC2 | dc2-el1 | 49.0001.0000.0004.0011.00 |
| DC2 | dc2-el2 | 49.0001.0000.0004.0012.00 |
| DC2 | dc2-el3 | 49.0001.0000.0004.0013.00 |
| DC2 | dc2-l1a | 49.0001.0000.0004.0001.00 |
| DC2 | dc2-l1b | 49.0001.0000.0004.0002.00 |
| DC2 | dc2-l2a | 49.0001.0000.0004.0003.00 |
| DC2 | dc2-l2b | 49.0001.0000.0004.0004.00 |
| DC2 | dc2-l3a | 49.0001.0000.0004.0005.00 |
| DC2 | dc2-l3b | 49.0001.0000.0004.0006.00 |
| DC2 | dc2-l4a | 49.0001.0000.0004.0007.00 |
| DC2 | dc2-l4b | 49.0001.0000.0004.0008.00 |
| DC2 | dc2-l5a | 49.0001.0000.0004.0009.00 |
| DC2 | dc2-l5b | 49.0001.0000.0004.0010.00 |
| DC2 | dc2-sp1 | 49.0001.0000.0003.0001.00 |
| DC2 | dc2-sp2 | 49.0001.0000.0003.0002.00 |
| DC2 | dc2-sp3 | 49.0001.0000.0003.0003.00 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 100.64.3.0/24 | 256 | 13 | 5.08 % |
| 100.66.3.0/24 | 256 | 13 | 5.08 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC1 | dc1-el1 | 100.64.3.21/32 |
| DC1 | dc1-el2 | 100.64.3.22/32 |
| DC1 | dc1-el3 | 100.64.3.23/32 |
| DC1 | dc1-l1a | 100.64.3.11/32 |
| DC1 | dc1-l1b | 100.64.3.11/32 |
| DC1 | dc1-l2a | 100.64.3.13/32 |
| DC1 | dc1-l2b | 100.64.3.13/32 |
| DC1 | dc1-l3a | 100.64.3.15/32 |
| DC1 | dc1-l3b | 100.64.3.15/32 |
| DC1 | dc1-l4a | 100.64.3.17/32 |
| DC1 | dc1-l4b | 100.64.3.17/32 |
| DC1 | dc1-l5a | 100.64.3.19/32 |
| DC1 | dc1-l5b | 100.64.3.19/32 |
| DC2 | dc2-el1 | 100.66.3.21/32 |
| DC2 | dc2-el2 | 100.66.3.22/32 |
| DC2 | dc2-el3 | 100.66.3.23/32 |
| DC2 | dc2-l1a | 100.66.3.11/32 |
| DC2 | dc2-l1b | 100.66.3.11/32 |
| DC2 | dc2-l2a | 100.66.3.13/32 |
| DC2 | dc2-l2b | 100.66.3.13/32 |
| DC2 | dc2-l3a | 100.66.3.15/32 |
| DC2 | dc2-l3b | 100.66.3.15/32 |
| DC2 | dc2-l4a | 100.66.3.17/32 |
| DC2 | dc2-l4b | 100.66.3.17/32 |
| DC2 | dc2-l5a | 100.66.3.19/32 |
| DC2 | dc2-l5b | 100.66.3.19/32 |
