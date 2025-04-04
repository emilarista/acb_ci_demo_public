# WAN

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
| WAN | pe | branch1-pe1 | 192.168.0.51/24 | vEOS-lab | Provisioned | - |
| WAN | pe | branch2-pe1 | 192.168.0.52/24 | vEOS-lab | Provisioned | - |
| WAN | pe | branch3-pe1 | 192.168.0.53/24 | vEOS-lab | Provisioned | - |
| WAN | pe | branch3-pe2 | 192.168.0.54/24 | vEOS-lab | Provisioned | - |
| WAN | pe | s1-edge-pe1 | 192.168.0.47/24 | vEOS-lab | Provisioned | - |
| WAN | pe | s1-edge-pe2 | 192.168.0.48/24 | vEOS-lab | Provisioned | - |
| WAN | p | s1-p1 | 192.168.0.43/24 | vEOS-lab | Provisioned | - |
| WAN | rr | s1-p2 | 192.168.0.45/24 | vEOS-lab | Provisioned | - |
| WAN | p | s1-p3 | 192.168.0.55/24 | vEOS-lab | Provisioned | - |
| WAN | p | s1-p4 | 192.168.0.56/24 | vEOS-lab | Provisioned | - |
| WAN | pe | s2-edge-pe1 | 192.168.0.49/24 | vEOS-lab | Provisioned | - |
| WAN | pe | s2-edge-pe2 | 192.168.0.50/24 | vEOS-lab | Provisioned | - |
| WAN | p | s2-p1 | 192.168.0.44/24 | vEOS-lab | Provisioned | - |
| WAN | rr | s2-p2 | 192.168.0.46/24 | vEOS-lab | Provisioned | - |
| WAN | p | s2-p3 | 192.168.0.57/24 | vEOS-lab | Provisioned | - |
| WAN | p | s2-p4 | 192.168.0.58/24 | vEOS-lab | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| pe | branch1-pe1 | Ethernet1 | p | s1-p4 | Ethernet4 |
| pe | branch2-pe1 | Ethernet1 | p | s1-p3 | Ethernet4 |
| pe | branch3-pe1 | Ethernet1 | p | s2-p3 | Ethernet4 |
| pe | branch3-pe1 | Ethernet2 | pe | branch3-pe2 | Ethernet2 |
| pe | branch3-pe2 | Ethernet1 | p | s2-p4 | Ethernet4 |
| pe | s1-edge-pe1 | Ethernet1 | p | s1-p3 | Ethernet1 |
| pe | s1-edge-pe1 | Ethernet2 | p | s1-p4 | Ethernet1 |
| pe | s1-edge-pe2 | Ethernet1 | p | s1-p3 | Ethernet2 |
| pe | s1-edge-pe2 | Ethernet2 | p | s1-p4 | Ethernet2 |
| p | s1-p1 | Ethernet4 | rr | s1-p2 | Ethernet4 |
| p | s1-p1 | Ethernet5 | p | s1-p3 | Ethernet5 |
| p | s1-p1 | Ethernet6 | p | s1-p4 | Ethernet6 |
| p | s1-p1 | Ethernet7 | p | s2-p1 | Ethernet7 |
| p | s1-p1 | Ethernet8 | p | s2-p1 | Ethernet8 |
| rr | s1-p2 | Ethernet5 | p | s1-p3 | Ethernet6 |
| rr | s1-p2 | Ethernet6 | p | s1-p4 | Ethernet5 |
| rr | s1-p2 | Ethernet7 | rr | s2-p2 | Ethernet7 |
| rr | s1-p2 | Ethernet8 | rr | s2-p2 | Ethernet8 |
| p | s1-p3 | Ethernet3 | p | s1-p4 | Ethernet3 |
| pe | s2-edge-pe1 | Ethernet1 | p | s2-p3 | Ethernet1 |
| pe | s2-edge-pe1 | Ethernet2 | p | s2-p4 | Ethernet1 |
| pe | s2-edge-pe2 | Ethernet1 | p | s2-p3 | Ethernet2 |
| pe | s2-edge-pe2 | Ethernet2 | p | s2-p4 | Ethernet2 |
| p | s2-p1 | Ethernet4 | rr | s2-p2 | Ethernet4 |
| p | s2-p1 | Ethernet5 | p | s2-p3 | Ethernet5 |
| p | s2-p1 | Ethernet6 | p | s2-p4 | Ethernet6 |
| rr | s2-p2 | Ethernet5 | p | s2-p3 | Ethernet6 |
| rr | s2-p2 | Ethernet6 | p | s2-p4 | Ethernet5 |
| p | s2-p3 | Ethernet3 | p | s2-p4 | Ethernet3 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| branch1-pe1 | Ethernet1 | 100.65.1.39/31 | s1-p4 | Ethernet4 | 100.65.1.38/31 |
| branch2-pe1 | Ethernet1 | 100.65.1.33/31 | s1-p3 | Ethernet4 | 100.65.1.32/31 |
| branch3-pe1 | Ethernet1 | 100.65.1.69/31 | s2-p3 | Ethernet4 | 100.65.1.68/31 |
| branch3-pe1 | Ethernet2 | 100.65.1.76/31 | branch3-pe2 | Ethernet2 | 100.65.1.77/31 |
| branch3-pe2 | Ethernet1 | 100.65.1.75/31 | s2-p4 | Ethernet4 | 100.65.1.74/31 |
| s1-edge-pe1 | Ethernet1 | 100.65.1.27/31 | s1-p3 | Ethernet1 | 100.65.1.26/31 |
| s1-edge-pe1 | Ethernet2 | 100.65.1.35/31 | s1-p4 | Ethernet1 | 100.65.1.34/31 |
| s1-edge-pe2 | Ethernet1 | 100.65.1.29/31 | s1-p3 | Ethernet2 | 100.65.1.28/31 |
| s1-edge-pe2 | Ethernet2 | 100.65.1.37/31 | s1-p4 | Ethernet2 | 100.65.1.36/31 |
| s1-p1 | Ethernet4 | 100.65.1.6/31 | s1-p2 | Ethernet4 | 100.65.1.7/31 |
| s1-p1 | Ethernet5 | 100.65.1.8/31 | s1-p3 | Ethernet5 | 100.65.1.9/31 |
| s1-p1 | Ethernet6 | 100.65.1.10/31 | s1-p4 | Ethernet6 | 100.65.1.11/31 |
| s1-p2 | Ethernet5 | 100.65.1.20/31 | s1-p3 | Ethernet6 | 100.65.1.21/31 |
| s1-p2 | Ethernet6 | 100.65.1.22/31 | s1-p4 | Ethernet5 | 100.65.1.23/31 |
| s1-p3 | Ethernet3 | 100.65.1.30/31 | s1-p4 | Ethernet3 | 100.65.1.31/31 |
| s2-edge-pe1 | Ethernet1 | 100.65.1.63/31 | s2-p3 | Ethernet1 | 100.65.1.62/31 |
| s2-edge-pe1 | Ethernet2 | 100.65.1.71/31 | s2-p4 | Ethernet1 | 100.65.1.70/31 |
| s2-edge-pe2 | Ethernet1 | 100.65.1.65/31 | s2-p3 | Ethernet2 | 100.65.1.64/31 |
| s2-edge-pe2 | Ethernet2 | 100.65.1.73/31 | s2-p4 | Ethernet2 | 100.65.1.72/31 |
| s2-p1 | Ethernet4 | 100.65.1.46/31 | s2-p2 | Ethernet4 | 100.65.1.47/31 |
| s2-p1 | Ethernet5 | 100.65.1.48/31 | s2-p3 | Ethernet5 | 100.65.1.49/31 |
| s2-p1 | Ethernet6 | 100.65.1.50/31 | s2-p4 | Ethernet6 | 100.65.1.51/31 |
| s2-p2 | Ethernet5 | 100.65.1.58/31 | s2-p3 | Ethernet6 | 100.65.1.59/31 |
| s2-p2 | Ethernet6 | 100.65.1.60/31 | s2-p4 | Ethernet5 | 100.65.1.61/31 |
| s2-p3 | Ethernet3 | 100.65.1.66/31 | s2-p4 | Ethernet3 | 100.65.1.67/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 100.65.2.0/24 | 256 | 6 | 2.35 % |
| 100.65.3.0/24 | 256 | 8 | 3.13 % |
| 100.65.4.0/24 | 256 | 2 | 0.79 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| WAN | branch1-pe1 | 100.65.3.5/32 |
| WAN | branch2-pe1 | 100.65.3.6/32 |
| WAN | branch3-pe1 | 100.65.3.7/32 |
| WAN | branch3-pe2 | 100.65.3.8/32 |
| WAN | s1-edge-pe1 | 100.65.3.1/32 |
| WAN | s1-edge-pe2 | 100.65.3.2/32 |
| WAN | s1-p1 | 100.65.2.1/32 |
| WAN | s1-p2 | 100.65.4.1/32 |
| WAN | s1-p3 | 100.65.2.3/32 |
| WAN | s1-p4 | 100.65.2.4/32 |
| WAN | s2-edge-pe1 | 100.65.3.3/32 |
| WAN | s2-edge-pe2 | 100.65.3.4/32 |
| WAN | s2-p1 | 100.65.2.2/32 |
| WAN | s2-p2 | 100.65.4.2/32 |
| WAN | s2-p3 | 100.65.2.5/32 |
| WAN | s2-p4 | 100.65.2.6/32 |

### ISIS CLNS interfaces

| POD | Node | CLNS Address |
| --- | ---- | ------------ |
| WAN | branch1-pe1 | 49.0001.0000.0006.0005.00 |
| WAN | branch2-pe1 | 49.0001.0000.0006.0006.00 |
| WAN | branch3-pe1 | 49.0001.0000.0006.0007.00 |
| WAN | branch3-pe2 | 49.0001.0000.0006.0008.00 |
| WAN | s1-edge-pe1 | 49.0001.0000.0006.0001.00 |
| WAN | s1-edge-pe2 | 49.0001.0000.0006.0002.00 |
| WAN | s1-p1 | 49.0001.0000.0005.0001.00 |
| WAN | s1-p2 | 49.0001.0000.0007.0001.00 |
| WAN | s1-p3 | 49.0001.0000.0005.0003.00 |
| WAN | s1-p4 | 49.0001.0000.0005.0004.00 |
| WAN | s2-edge-pe1 | 49.0001.0000.0006.0003.00 |
| WAN | s2-edge-pe2 | 49.0001.0000.0006.0004.00 |
| WAN | s2-p1 | 49.0001.0000.0005.0002.00 |
| WAN | s2-p2 | 49.0001.0000.0007.0002.00 |
| WAN | s2-p3 | 49.0001.0000.0005.0005.00 |
| WAN | s2-p4 | 49.0001.0000.0005.0006.00 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
