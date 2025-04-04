# dc1-el1

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [IP Name Servers](#ip-name-servers)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
- [Management Security](#management-security)
  - [Management Security Summary](#management-security-summary)
  - [Management Security Configuration](#management-security-configuration)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Configuration](#internal-vlan-allocation-policy-configuration)
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [Interfaces](#interfaces)
  - [Switchport Default](#switchport-default)
  - [Interface Defaults](#interface-defaults)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
  - [VLAN Interfaces](#vlan-interfaces)
  - [VXLAN Interface](#vxlan-interface)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [Virtual Router MAC Address](#virtual-router-mac-address)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router ISIS](#router-isis)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
- [MPLS](#mpls)
  - [MPLS and LDP](#mpls-and-ldp)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [EOS CLI](#eos-cli)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | MGMT | 192.168.0.24/24 | 192.168.0.5 |

##### IPv6

| Management Interface | description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management1 | oob_management | oob | MGMT | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management1
   description oob_management
   no shutdown
   vrf MGMT
   ip address 192.168.0.24/24
```

### IP Name Servers

#### IP Name Servers Summary

| Name Server | VRF | Priority |
| ----------- | --- | -------- |
| 8.8.8.8 | MGMT | - |
| 8.8.4.4 | MGMT | - |

#### IP Name Servers Device Configuration

```eos
ip name-server vrf MGMT 8.8.4.4
ip name-server vrf MGMT 8.8.8.8
```

### Management API HTTP

#### Management API HTTP Summary

| HTTP | HTTPS | Default Services |
| ---- | ----- | ---------------- |
| False | True | - |

#### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| default | - | - |
| MGMT | - | - |

#### Management API HTTP Configuration

```eos
!
management api http-commands
   protocol https
   no shutdown
   !
   vrf default
      no shutdown
   !
   vrf MGMT
      no shutdown
```

## Authentication

### Local Users

#### Local Users Summary

| User | Privilege | Role | Disabled | Shell |
| ---- | --------- | ---- | -------- | ----- |
| admin | 15 | network-admin | False | - |
| arista | 15 | network-admin | False | - |
| cvpadmin | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
username admin privilege 15 role network-admin nopassword
username arista privilege 15 role network-admin secret sha512 <removed>
username cvpadmin privilege 15 role network-admin secret sha512 <removed>
```

## Management Security

### Management Security Summary

| Settings | Value |
| -------- | ----- |
| Common password encryption key | True |

### Management Security Configuration

```eos
!
management security
   password encryption-key common
```

## Monitoring

### TerminAttr Daemon

#### TerminAttr Daemon Summary

| CV Compression | CloudVision Servers | VRF | Authentication | Smash Excludes | Ingest Exclude | Bypass AAA |
| -------------- | ------------------- | --- | -------------- | -------------- | -------------- | ---------- |
| gzip | 192.168.0.5:9910 | MGMT | token,/tmp/token | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | False |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=192.168.0.5:9910 -cvauth=token,/tmp/token -cvvrf=MGMT -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs
   no shutdown
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 4096 |

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
spanning-tree mst 0 priority 4096
```

## Internal VLAN Allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 3700 | 3900 |

### Internal VLAN Allocation Policy Configuration

```eos
!
vlan internal order ascending range 3700 3900
```

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 10 | C1_10 | - |
| 20 | C2_20 | - |
| 30 | C3_30 | - |

### VLANs Device Configuration

```eos
!
vlan 10
   name C1_10
!
vlan 20
   name C2_20
!
vlan 30
   name C3_30
```

## Interfaces

### Switchport Default

#### Switchport Defaults Summary

- Default Switchport Mode: routed

#### Switchport Default Configuration

```eos
!
switchport default mode routed
```

### Interface Defaults

#### Interface Defaults Summary

- Default Ethernet Interface Shutdown: True

#### Interface Defaults Configuration

```eos
!
interface defaults
   ethernet
      shutdown
```

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |

*Inherited from Port-Channel Interface

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet1 | P2P_LINK_TO_DC1-SP1_Ethernet11 | routed | - | 100.64.1.61/31 | default | 1500 | False | - | - |
| Ethernet2 | P2P_LINK_TO_DC1-SP2_Ethernet11 | routed | - | 100.64.1.63/31 | default | 1500 | False | - | - |
| Ethernet3 | P2P_LINK_TO_DC1-SP3_Ethernet11 | routed | - | 100.64.1.65/31 | default | 1500 | False | - | - |
| Ethernet4 | P2P_LINK_TO_s1-p1_Ethernet1 | routed | - | 100.65.1.1/31 | default | 1500 | False | - | - |
| Ethernet5 | P2P_LINK_TO_s1-p2_Ethernet1 | routed | - | 100.65.1.15/31 | default | 1500 | False | - | - |

##### ISIS

| Interface | Channel Group | ISIS Instance | ISIS Metric | Mode | ISIS Circuit Type | Hello Padding | Authentication Mode |
| --------- | ------------- | ------------- | ----------- | ---- | ----------------- | ------------- | ------------------- |
| Ethernet1 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet2 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet3 | - | CORE | 50 | point-to-point | level-2 | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description P2P_LINK_TO_DC1-SP1_Ethernet11
   no shutdown
   mtu 1500
   no switchport
   ip address 100.64.1.61/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet2
   description P2P_LINK_TO_DC1-SP2_Ethernet11
   no shutdown
   mtu 1500
   no switchport
   ip address 100.64.1.63/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet3
   description P2P_LINK_TO_DC1-SP3_Ethernet11
   no shutdown
   mtu 1500
   no switchport
   ip address 100.64.1.65/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet4
   description P2P_LINK_TO_s1-p1_Ethernet1
   no shutdown
   mtu 1500
   no switchport
   ip address 100.65.1.1/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis authentication mode md5
   isis authentication key 7 $1c$sTNAlR6rKSw=
   isis network point-to-point

!
interface Ethernet5
   description P2P_LINK_TO_s1-p2_Ethernet1
   no shutdown
   mtu 1500
   no switchport
   ip address 100.65.1.15/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis authentication mode md5
   isis authentication key 7 $1c$sTNAlR6rKSw=
   isis network point-to-point

```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 100.64.2.21/32 |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | 100.64.3.21/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | - |

##### ISIS

| Interface | ISIS instance | ISIS metric | Interface mode |
| --------- | ------------- | ----------- | -------------- |
| Loopback0 | CORE | - | passive |
| Loopback1 | CORE | - | passive |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 100.64.2.21/32
   isis enable CORE
   isis passive
   node-segment ipv4 index 511
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   no shutdown
   ip address 100.64.3.21/32
   isis enable CORE
   isis passive
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan10 | C1_10 | C1_VRF1 | - | False |
| Vlan20 | C2_20 | C2_VRF1 | - | False |
| Vlan30 | C3_30 | C3_VRF1 | - | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan10 |  C1_VRF1  |  -  |  10.1.10.1/24  |  -  |  -  |  -  |  -  |
| Vlan20 |  C2_VRF1  |  -  |  10.2.20.1/24  |  -  |  -  |  -  |  -  |
| Vlan30 |  C3_VRF1  |  -  |  10.3.30.1/24  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan10
   description C1_10
   no shutdown
   vrf C1_VRF1
   ip address virtual 10.1.10.1/24
!
interface Vlan20
   description C2_20
   no shutdown
   vrf C2_VRF1
   ip address virtual 10.2.20.1/24
!
interface Vlan30
   description C3_30
   no shutdown
   vrf C3_VRF1
   ip address virtual 10.3.30.1/24
```

### VXLAN Interface

#### VXLAN Interface Summary

| Setting | Value |
| ------- | ----- |
| Source Interface | Loopback1 |
| UDP port | 4789 |

##### VLAN to VNI, Flood List and Multicast Group Mappings

| VLAN | VNI | Flood List | Multicast Group |
| ---- | --- | ---------- | --------------- |
| 10 | 10010 | - | - |
| 20 | 20020 | - | - |
| 30 | 30030 | - | - |

##### VRF to VNI and Multicast Group Mappings

| VRF | VNI | Multicast Group |
| ---- | --- | --------------- |
| C1_VRF1 | 10 | - |
| C2_VRF1 | 20 | - |
| C3_VRF1 | 30 | - |

#### VXLAN Interface Device Configuration

```eos
!
interface Vxlan1
   description dc1-el1_VTEP
   vxlan source-interface Loopback1
   vxlan udp-port 4789
   vxlan vlan 10 vni 10010
   vxlan vlan 20 vni 20020
   vxlan vlan 30 vni 30030
   vxlan vrf C1_VRF1 vni 10
   vxlan vrf C2_VRF1 vni 20
   vxlan vrf C3_VRF1 vni 30
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### Virtual Router MAC Address

#### Virtual Router MAC Address Summary

##### Virtual Router MAC Address: 00:1c:73:00:dc:00

#### Virtual Router MAC Address Configuration

```eos
!
ip virtual-router mac-address 00:1c:73:00:dc:00
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| C1_VRF1 | True |
| C2_VRF1 | True |
| C3_VRF1 | True |
| MGMT | False |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf C1_VRF1
ip routing vrf C2_VRF1
ip routing vrf C3_VRF1
no ip routing vrf MGMT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| C1_VRF1 | false |
| C2_VRF1 | false |
| C3_VRF1 | false |
| MGMT | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP             | Exit interface      | Administrative Distance       | Tag               | Route Name                    | Metric         |
| --- | ------------------ | ----------------------- | ------------------- | ----------------------------- | ----------------- | ----------------------------- | -------------- |
| MGMT | 0.0.0.0/0 | 192.168.0.5 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf MGMT 0.0.0.0/0 192.168.0.5
```

### Router ISIS

#### Router ISIS Summary

| Settings | Value |
| -------- | ----- |
| Instance | CORE |
| Net-ID | 49.0001.0000.0002.0011.00 |
| Type | level-2 |
| Router-ID | 100.64.2.21 |
| Log Adjacency Changes | True |
| Advertise Passive-only | True |
| SR MPLS Enabled | True |

#### ISIS Interfaces Summary

| Interface | ISIS Instance | ISIS Metric | Interface Mode |
| --------- | ------------- | ----------- | -------------- |
| Ethernet1 | CORE | 50 | point-to-point |
| Ethernet2 | CORE | 50 | point-to-point |
| Ethernet3 | CORE | 50 | point-to-point |
| Loopback0 | CORE | - | passive |
| Loopback1 | CORE | - | passive |

#### ISIS Segment-routing Node-SID

| Loopback | IPv4 Index | IPv6 Index |
| -------- | ---------- | ---------- |
| Loopback0 | 511 | - |

#### ISIS IPv4 Address Family Summary

| Settings | Value |
| -------- | ----- |
| IPv4 Address-family Enabled | True |
| Maximum-paths | 4 |

#### Router ISIS Device Configuration

```eos
!
router isis CORE
   net 49.0001.0000.0002.0011.00
   is-type level-2
   router-id ipv4 100.64.2.21
   log-adjacency-changes
   advertise passive-only
   !
   address-family ipv4 unicast
      maximum-paths 4
   !
   segment-routing mpls
      no shutdown
```

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65000.106|  100.64.2.21 |

| BGP Tuning |
| ---------- |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| graceful-restart restart-time 300 |
| graceful-restart |
| bgp asn notation asdot |
| bgp bestpath d-path |
| no bgp default ipv4-unicast |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### EVPN-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Source | Loopback0 |
| BFD | True |
| Ebgp multihop | 10 |
| Send community | all |
| Maximum routes | 0 (no limit) |

##### IPVPN-GATEWAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | mpls |
| Local AS | 65001 |
| Source | Loopback0 |
| BFD | True |
| Send community | all |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- |
| 100.64.2.1 | 65000.100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.64.2.2 | 65000.100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.64.2.3 | 65000.100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.65.4.1 | 65001 | default | - | Inherited from peer group IPVPN-GATEWAY-PEERS | Inherited from peer group IPVPN-GATEWAY-PEERS | - | Inherited from peer group IPVPN-GATEWAY-PEERS | - | - | - |
| 100.65.4.2 | 65001 | default | - | Inherited from peer group IPVPN-GATEWAY-PEERS | Inherited from peer group IPVPN-GATEWAY-PEERS | - | Inherited from peer group IPVPN-GATEWAY-PEERS | - | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP VPN-IPv4 Address Family

##### VPN-IPv4 Peer Groups

| Peer Group | Activate | Route-map In | Route-map Out |
| ---------- | -------- | ------------ | ------------- |
| IPVPN-GATEWAY-PEERS | True | - | - |

#### Router BGP VLANs

| VLAN | Route-Distinguisher | Both Route-Target | Import Route Target | Export Route-Target | Redistribute |
| ---- | ------------------- | ----------------- | ------------------- | ------------------- | ------------ |
| 10 | 100.64.2.21:10010 | 65000:10010 | - | - | learned |
| 20 | 100.64.2.21:20020 | 65000:20020 | - | - | learned |
| 30 | 100.64.2.21:30030 | 65000:30030 | - | - | learned |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| C1_VRF1 | 100.64.2.21:10 | connected |
| C2_VRF1 | 100.64.2.21:20 | connected |
| C3_VRF1 | 100.64.2.21:30 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65000.106
   router-id 100.64.2.21
   maximum-paths 4 ecmp 4
   no bgp default ipv4-unicast
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   bgp asn notation asdot
   bgp bestpath d-path
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 10
   neighbor EVPN-OVERLAY-PEERS password 7 <removed>
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPVPN-GATEWAY-PEERS peer group
   neighbor IPVPN-GATEWAY-PEERS local-as 65001 no-prepend replace-as
   neighbor IPVPN-GATEWAY-PEERS update-source Loopback0
   neighbor IPVPN-GATEWAY-PEERS bfd
   neighbor IPVPN-GATEWAY-PEERS password 7 <removed>
   neighbor IPVPN-GATEWAY-PEERS send-community
   neighbor IPVPN-GATEWAY-PEERS maximum-routes 0
   neighbor 100.64.2.1 peer group EVPN-OVERLAY-PEERS
   neighbor 100.64.2.1 remote-as 65000.100
   neighbor 100.64.2.1 description dc1-sp1
   neighbor 100.64.2.2 peer group EVPN-OVERLAY-PEERS
   neighbor 100.64.2.2 remote-as 65000.100
   neighbor 100.64.2.2 description dc1-sp2
   neighbor 100.64.2.3 peer group EVPN-OVERLAY-PEERS
   neighbor 100.64.2.3 remote-as 65000.100
   neighbor 100.64.2.3 description dc1-sp3
   neighbor 100.65.4.1 peer group IPVPN-GATEWAY-PEERS
   neighbor 100.65.4.1 remote-as 65001
   neighbor 100.65.4.1 description s1-p2
   neighbor 100.65.4.2 peer group IPVPN-GATEWAY-PEERS
   neighbor 100.65.4.2 remote-as 65001
   neighbor 100.65.4.2 description s2-p2
   !
   vlan 10
      rd 100.64.2.21:10010
      route-target both 65000:10010
      redistribute learned
   !
   vlan 20
      rd 100.64.2.21:20020
      route-target both 65000:20020
      redistribute learned
   !
   vlan 30
      rd 100.64.2.21:30030
      route-target both 65000:30030
      redistribute learned
   !
   address-family evpn
      domain identifier 1:1
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      no neighbor IPVPN-GATEWAY-PEERS activate
   !
   address-family vpn-ipv4
      domain identifier 1:2
      neighbor IPVPN-GATEWAY-PEERS activate
      neighbor default encapsulation mpls next-hop-self source-interface Loopback0
   !
   vrf C1_VRF1
      rd 100.64.2.21:10
      route-target import evpn 65000:10
      route-target import vpn-ipv4 65001:10
      route-target export evpn 65000:10
      route-target export vpn-ipv4 65001:10
      router-id 100.64.2.21
      redistribute connected
   !
   vrf C2_VRF1
      rd 100.64.2.21:20
      route-target import evpn 65000:20
      route-target import vpn-ipv4 65001:20
      route-target export evpn 65000:20
      route-target export vpn-ipv4 65001:20
      router-id 100.64.2.21
      redistribute connected
   !
   vrf C3_VRF1
      rd 100.64.2.21:30
      route-target import evpn 65000:30
      route-target import vpn-ipv4 65001:30
      route-target export evpn 65000:30
      route-target export vpn-ipv4 65001:30
      router-id 100.64.2.21
      redistribute connected
```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 10000 | 10000 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 10000 min-rx 10000 multiplier 3
```

## MPLS

### MPLS and LDP

#### MPLS and LDP Summary

| Setting | Value |
| -------- | ---- |
| MPLS IP Enabled | True |
| LDP Enabled | False |
| LDP Router ID | - |
| LDP Interface Disabled Default | - |
| LDP Transport-Address Interface | - |

#### MPLS and LDP Configuration

```eos
!
mpls ip
```

## Multicast

### IP IGMP Snooping

#### IP IGMP Snooping Summary

| IGMP Snooping | Fast Leave | Interface Restart Query | Proxy | Restart Query Interval | Robustness Variable |
| ------------- | ---------- | ----------------------- | ----- | ---------------------- | ------------------- |
| Enabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| C1_VRF1 | enabled |
| C2_VRF1 | enabled |
| C3_VRF1 | enabled |
| MGMT | disabled |

### VRF Instances Device Configuration

```eos
!
vrf instance C1_VRF1
!
vrf instance C2_VRF1
!
vrf instance C3_VRF1
!
vrf instance MGMT
```

## EOS CLI

```eos
!
agent KernelFib environment KERNELFIB_PROGRAM_ALL_ECMP='true'
platform tfa personality arfa

```
