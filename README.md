# MOFED AUR

Mellanox OpenFabrics Enterprise Distribution (OFED) packages for Arch Linux.
Part of an effort to bring first-class HPC support for Arch.

![arch](./README.png)

<!-- collapse -->
<details>
<summary></summary>

```plantuml
@startuml
'top to bottom direction
left to right direction

skinparam linetype polyline

skinparam componentStyle rectangle
skinparam backgroundColor #1a1a1a
skinparam defaultFontSize 12
skinparam defaultFontName "Courier New"

'make arrows colorful with neon effect
skinparam arrow {
    Color #00ff88
    FontColor #00ff88
    FontStyle bold
    Thickness 2
}

'make packages cyberpunk style
skinparam package {
    BackgroundColor #2b213a
    BorderColor #ff00ff
    FontColor #00ffff
    BorderThickness 2
    FontStyle bold
}

'make components cyberpunk style
skinparam component {
    BackgroundColor #3a2142
    BorderColor #00ffff
    FontColor #ff00ff
    BorderThickness 2
    FontStyle bold
}

'add stereotypes for visual grouping
package "<<Applications>>\nAPPLICATIONS LAYER" as apps {
    component "HPC Applications" as hpc
    component "Machine Learning\n(PyTorch, TensorFlow)" as ml
    component "Storage Applications\n(NFS, iSCSI, NVMe)" as storage
    component "Containerization\n(Docker, K8s)" as containers
}

package "<<Frameworks>>\nHIGH-LEVEL LIBRARIES" as frameworks {
    component "OpenMPI (mlnx-openmpi)" as openmpi
    component "UCX (mlnx-ucx)" as ucx
    component "XLIO (mlnx-libxlio)" as xlio
    component "VMA (mlnx-libvma)" as vma
}

package "<<Core>>\nCORE LIBRARIES & TOOLS" as core {
    component "RDMA Core (mlnx-rdma-core)" as rdma_core
    component "XPMEM Library\n(mlnx-xpmem-lib)" as xpmem_lib
    component "Management Tools\n(mlnx-tools)" as tools
    component "Diagnostic Tools\n(mlnx-ibdump, mlnx-perftest)" as diag
}

package "<<Drivers>>\nNETWORK & STORAGE DRIVERS" as drivers {
    component "OFA Kernel Driver\n(mlnx-ofa_kernel)" as ofa
    component "Storage Drivers\n(mlnx-iser, mlnx-nvme)" as storage_drivers
    component "Network Drivers\n(mlnx-nfsrdma)" as net_drivers
}

package "<<Kernel>>\nKERNEL MODULES" as kernel {
    component "XPMEM Module\n(mlnx-xpmem)" as xpmem
    component "KNEM Module\n(mlnx-knem)" as knem
    component "Firmware Tools\n(mlnx-kernel-mft)" as mft
}

package "<<Testing>>\nTESTING & SIMULATION" as testing {
    component "Performance Testing\n(mlnx-mpitests, mlnx-sockperf)" as perf_test
    component "Fabric Simulation\n(mlnx-ibsim)" as ibsim
}

package "<<Network>>\nNETWORK MANAGEMENT" as network {
    component "OpenVSwitch\n(mlnx-openvswitch)" as ovs
    component "Network Tools\n(mlnx-ethtool, mlnx-iproute2)" as nettools
}

' Relationships with neon colors
hpc -[#ff00ff]-> openmpi
hpc -[#ff00ff]-> ucx
ml -[#ff00ff]-> ucx
storage -[#ff00ff]-> storage_drivers
containers -[#ff00ff]-> ovs

openmpi -[#00ffff]-> rdma_core
ucx -[#00ffff]-> rdma_core
xlio -[#00ffff]-> rdma_core
vma -[#00ffff]-> rdma_core

rdma_core -[#00ff88]-> ofa
storage_drivers -[#00ff88]-> ofa
net_drivers -[#00ff88]-> ofa

ofa -[#ff00ff]-> xpmem
ofa -[#ff00ff]-> knem
ofa -[#ff00ff]-> mft

tools -[#00ffff]-> rdma_core
diag -[#00ffff]-> rdma_core

xpmem_lib -[#00ff88]-> xpmem
perf_test -[#00ff88]-> rdma_core
ibsim -[#00ff88]-> rdma_core

ovs -[#ff00ff]-> ofa
nettools -[#ff00ff]-> ofa

@enduml
```

</details>

## Package List

| Package Name       | Version       | Description                                        |
|--------------------|---------------|----------------------------------------------------|
| mlnx-xpmem         | 2.7.4         | XPMEM (Cross-Partition Memory) Linux kernel module |
| mlnx-xpmem-lib     | 2.7           | XPMEM (Cross-Partition Memory) library             |
| mlnx-knem          | 1.1.4.90mlnx3 | High-Performance Intra-Node MPI Communication      |
| mlnx-rdma-core     | 2410mlnx54    | RDMA core userspace libraries and daemons          |
| mlnx-ofa_kernel    | 24.10         | Mellanox OpenFabrics Alliance kernel driver        |
| mlnx-kernel-mft    | 4.30.1        | Mellanox Firmware Tools kernel driver              |
| mlnx-fwctl         | 24.10         | Mellanox firmware control utility                  |
| mlnx-ibdump        | 6.0.0         | InfiniBand network sniffer                         |
| mlnx-ibsim         | 0.12          | InfiniBand fabric simulator                        |
| mlnx-ibarr         | 0.1.3         | InfiniBand Address Resolution Responder            |
| mlnx-tools         | 24.10         | Mellanox firmware management and diagnostic tools  |
| mlnx-steering-dump | 1.0.0         | Mellanox steering dump utility                     |
| mlnx-ethtool       | 6.9           | Mellanox-enhanced ethtool utility                  |
| mlnx-iproute2      | 6.10.0        | Mellanox-enhanced iproute2 utility                 |
| mlnx-perftest      | 24.10.0       | InfiniBand performance tests                       |
| mlnx-sockperf      | 3.10          | Network benchmarking utility                       |
| mlnx-ucx           | 1.18.0        | Unified Communication X library                    |
| mlnx-openmpi       | 4.1.7rc1      | High-performance message passing library           |
| mlnx-mpitests      | 3.2.24        | MPI benchmarks and tests                           |
| mlnx-libvma        | 9.8.60        | Mellanox Messaging Accelerator library             |
| mlnx-libxlio       | 3.40.2        | Mellanox Accelerated I/O library                   |
| mlnx-multiperf     | 3.0           | Network performance testing tool                   |
| mlnx-openvswitch   | 2.17.8        | Production quality, multilayer virtual switch      |
| mlnx-iser          | 24.10         | iSCSI Extension for RDMA (iSER) target driver      |
| mlnx-isert         | 24.10         | iSER target kernel module                          |
| mlnx-srp           | 24.10         | SCSI RDMA Protocol initiator driver                |
| mlnx-nfsrdma       | 24.10         | NFS over RDMA client driver                        |
| mlnx-nvme          | 24.10         | NVMe over Fabrics host driver                      |
| mlnx-rshim         | 2.1.8         | Remote System Health Information Module driver     |
| mlnx-ofed-scripts  | 24.10         | OpenFabrics Enterprise Distribution scripts        |
| mlnx-ofed-docs     | 24.10         | OpenFabrics Enterprise Distribution documentation  |

## Installation

To install all of these packages, clone this repository and navigate to the desired package directory. Then run:

```bash
make
```

or use `yay` to install each one individually, e.g.:

```bash
yay -S xpmem
```

## Disclaimer

These packages are unofficial and not directly supported by Mellanox. Use at your own risk.
