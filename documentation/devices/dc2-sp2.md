# dc2-sp2

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
- [Interfaces](#interfaces)
  - [Switchport Default](#switchport-default)
  - [Interface Defaults](#interface-defaults)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router ISIS](#router-isis)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
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
| Management1 | oob_management | oob | MGMT | 192.168.0.28/24 | 192.168.0.5 |

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
   ip address 192.168.0.28/24
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

STP mode: **none**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode none
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
| Ethernet1 | P2P_LINK_TO_DC2-L1A_Ethernet2 | routed | - | 100.66.1.2/31 | default | 1500 | False | - | - |
| Ethernet2 | P2P_LINK_TO_DC2-L1B_Ethernet2 | routed | - | 100.66.1.8/31 | default | 1500 | False | - | - |
| Ethernet3 | P2P_LINK_TO_DC2-L2A_Ethernet2 | routed | - | 100.66.1.14/31 | default | 1500 | False | - | - |
| Ethernet4 | P2P_LINK_TO_DC2-L2B_Ethernet2 | routed | - | 100.66.1.20/31 | default | 1500 | False | - | - |
| Ethernet5 | P2P_LINK_TO_DC2-L3A_Ethernet2 | routed | - | 100.66.1.26/31 | default | 1500 | False | - | - |
| Ethernet6 | P2P_LINK_TO_DC2-L3B_Ethernet2 | routed | - | 100.66.1.32/31 | default | 1500 | False | - | - |
| Ethernet7 | P2P_LINK_TO_DC2-L4A_Ethernet2 | routed | - | 100.66.1.38/31 | default | 1500 | False | - | - |
| Ethernet8 | P2P_LINK_TO_DC2-L4B_Ethernet2 | routed | - | 100.66.1.44/31 | default | 1500 | False | - | - |
| Ethernet9 | P2P_LINK_TO_DC2-L5A_Ethernet2 | routed | - | 100.66.1.50/31 | default | 1500 | False | - | - |
| Ethernet10 | P2P_LINK_TO_DC2-L5B_Ethernet2 | routed | - | 100.66.1.56/31 | default | 1500 | False | - | - |
| Ethernet11 | P2P_LINK_TO_DC2-EL1_Ethernet2 | routed | - | 100.66.1.62/31 | default | 1500 | False | - | - |
| Ethernet12 | P2P_LINK_TO_DC2-EL2_Ethernet2 | routed | - | 100.66.1.68/31 | default | 1500 | False | - | - |
| Ethernet13 | P2P_LINK_TO_DC2-EL3_Ethernet2 | routed | - | 100.66.1.74/31 | default | 1500 | False | - | - |

##### ISIS

| Interface | Channel Group | ISIS Instance | ISIS Metric | Mode | ISIS Circuit Type | Hello Padding | Authentication Mode |
| --------- | ------------- | ------------- | ----------- | ---- | ----------------- | ------------- | ------------------- |
| Ethernet1 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet2 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet3 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet4 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet5 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet6 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet7 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet8 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet9 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet10 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet11 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet12 | - | CORE | 50 | point-to-point | level-2 | - | - |
| Ethernet13 | - | CORE | 50 | point-to-point | level-2 | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description P2P_LINK_TO_DC2-L1A_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.2/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet2
   description P2P_LINK_TO_DC2-L1B_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.8/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet3
   description P2P_LINK_TO_DC2-L2A_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.14/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet4
   description P2P_LINK_TO_DC2-L2B_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.20/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet5
   description P2P_LINK_TO_DC2-L3A_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.26/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet6
   description P2P_LINK_TO_DC2-L3B_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.32/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet7
   description P2P_LINK_TO_DC2-L4A_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.38/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet8
   description P2P_LINK_TO_DC2-L4B_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.44/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet9
   description P2P_LINK_TO_DC2-L5A_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.50/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet10
   description P2P_LINK_TO_DC2-L5B_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.56/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet11
   description P2P_LINK_TO_DC2-EL1_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.62/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet12
   description P2P_LINK_TO_DC2-EL2_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.68/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
!
interface Ethernet13
   description P2P_LINK_TO_DC2-EL3_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 100.66.1.74/31
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis network point-to-point
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 100.66.2.2/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |

##### ISIS

| Interface | ISIS instance | ISIS metric | Interface mode |
| --------- | ------------- | ----------- | -------------- |
| Loopback0 | CORE | - | passive |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 100.66.2.2/32
   isis enable CORE
   isis passive
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| MGMT | False |

#### IP Routing Device Configuration

```eos
!
ip routing
no ip routing vrf MGMT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
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
| Net-ID | 49.0001.0000.0003.0002.00 |
| Type | level-2 |
| Router-ID | 100.66.2.2 |
| Log Adjacency Changes | True |
| Advertise Passive-only | True |

#### ISIS Interfaces Summary

| Interface | ISIS Instance | ISIS Metric | Interface Mode |
| --------- | ------------- | ----------- | -------------- |
| Ethernet1 | CORE | 50 | point-to-point |
| Ethernet2 | CORE | 50 | point-to-point |
| Ethernet3 | CORE | 50 | point-to-point |
| Ethernet4 | CORE | 50 | point-to-point |
| Ethernet5 | CORE | 50 | point-to-point |
| Ethernet6 | CORE | 50 | point-to-point |
| Ethernet7 | CORE | 50 | point-to-point |
| Ethernet8 | CORE | 50 | point-to-point |
| Ethernet9 | CORE | 50 | point-to-point |
| Ethernet10 | CORE | 50 | point-to-point |
| Ethernet11 | CORE | 50 | point-to-point |
| Ethernet12 | CORE | 50 | point-to-point |
| Ethernet13 | CORE | 50 | point-to-point |
| Loopback0 | CORE | - | passive |

#### ISIS IPv4 Address Family Summary

| Settings | Value |
| -------- | ----- |
| IPv4 Address-family Enabled | True |
| Maximum-paths | 4 |

#### Router ISIS Device Configuration

```eos
!
router isis CORE
   net 49.0001.0000.0003.0002.00
   is-type level-2
   router-id ipv4 100.66.2.2
   log-adjacency-changes
   advertise passive-only
   !
   address-family ipv4 unicast
      maximum-paths 4
   !
```

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65000.200|  100.66.2.2 |

| BGP Tuning |
| ---------- |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| graceful-restart restart-time 300 |
| graceful-restart |
| bgp asn notation asdot |
| no bgp default ipv4-unicast |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### EVPN-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Next-hop unchanged | True |
| Source | Loopback0 |
| BFD | True |
| Ebgp multihop | 10 |
| Send community | all |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- |
| 100.64.2.1 | 65000.100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.64.2.2 | 65000.100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.64.2.3 | 65000.100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.11 | 65000.201 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.12 | 65000.201 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.13 | 65000.202 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.14 | 65000.202 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.15 | 65000.203 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.16 | 65000.203 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.17 | 65000.204 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.18 | 65000.204 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.19 | 65000.205 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.20 | 65000.205 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.21 | 65000.206 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.22 | 65000.206 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |
| 100.66.2.23 | 65000.206 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP Device Configuration

```eos
!
router bgp 65000.200
   router-id 100.66.2.2
   maximum-paths 4 ecmp 4
   no bgp default ipv4-unicast
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   bgp asn notation asdot
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS next-hop-unchanged
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 10
   neighbor EVPN-OVERLAY-PEERS password 7 <removed>
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor 100.64.2.1 peer group EVPN-OVERLAY-PEERS
   neighbor 100.64.2.1 remote-as 65000.100
   neighbor 100.64.2.1 description dc1-sp1
   neighbor 100.64.2.2 peer group EVPN-OVERLAY-PEERS
   neighbor 100.64.2.2 remote-as 65000.100
   neighbor 100.64.2.2 description dc1-sp2
   neighbor 100.64.2.3 peer group EVPN-OVERLAY-PEERS
   neighbor 100.64.2.3 remote-as 65000.100
   neighbor 100.64.2.3 description dc1-sp3
   neighbor 100.66.2.11 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.11 remote-as 65000.201
   neighbor 100.66.2.11 description dc2-l1a
   neighbor 100.66.2.12 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.12 remote-as 65000.201
   neighbor 100.66.2.12 description dc2-l1b
   neighbor 100.66.2.13 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.13 remote-as 65000.202
   neighbor 100.66.2.13 description dc2-l2a
   neighbor 100.66.2.14 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.14 remote-as 65000.202
   neighbor 100.66.2.14 description dc2-l2b
   neighbor 100.66.2.15 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.15 remote-as 65000.203
   neighbor 100.66.2.15 description dc2-l3a
   neighbor 100.66.2.16 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.16 remote-as 65000.203
   neighbor 100.66.2.16 description dc2-l3b
   neighbor 100.66.2.17 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.17 remote-as 65000.204
   neighbor 100.66.2.17 description dc2-l4a
   neighbor 100.66.2.18 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.18 remote-as 65000.204
   neighbor 100.66.2.18 description dc2-l4b
   neighbor 100.66.2.19 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.19 remote-as 65000.205
   neighbor 100.66.2.19 description dc2-l5a
   neighbor 100.66.2.20 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.20 remote-as 65000.205
   neighbor 100.66.2.20 description dc2-l5b
   neighbor 100.66.2.21 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.21 remote-as 65000.206
   neighbor 100.66.2.21 description dc2-el1
   neighbor 100.66.2.22 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.22 remote-as 65000.206
   neighbor 100.66.2.22 description dc2-el2
   neighbor 100.66.2.23 peer group EVPN-OVERLAY-PEERS
   neighbor 100.66.2.23 remote-as 65000.206
   neighbor 100.66.2.23 description dc2-el3
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
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

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| MGMT | disabled |

### VRF Instances Device Configuration

```eos
!
vrf instance MGMT
```

## EOS CLI

```eos
!
agent KernelFib environment KERNELFIB_PROGRAM_ALL_ECMP='true'
platform tfa personality arfa

```
