# WAN/DC CI Demo for ACT

## MPLS Data Plane

MPLS Data Plane in ACT and vEOS in general tends to work best with arfa personality:

```eos
platform tfa personality arfa
```

## EOS Versions

Repo was tested and set up with 4.29.2F on all nodes. This in combination with setting platform tfa personality to arfa instead of the default python seems to work best with MPLS data plane and interworking stuff.

## CI Actions



