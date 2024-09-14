# MOFED AUR

Mellanox Open Fabric Distribution (OFED) packages for Arch Linux.
Part of an effort to bring first-class HPC support for Arch.

## Package List

| Package Name      | Version       | Description                                        |
| ----------------- | ------------- | -------------------------------------------------- |
| xpmem             | 2.7.3         | XPMEM (Cross-Partition Memory) Linux kernel module |
| xpmem-lib         | 2.7           | XPMEM (Cross-Partition Memory) library             |
| knem              | 1.1.4.90mlnx3 | High-Performance Intra-Node MPI Communication      |
| rdma-core         | 2407mlnx52    | RDMA core userspace libraries and daemons          |
| mlnx-ofa_kernel   | 24.07         | Mellanox OpenFabrics Alliance kernel driver        |
| kernel-mft        | 4.29.0        | Mellanox Firmware Tools kernel driver              |
| fwctl             | 24.07         | Mellanox firmware control utility                  |
| ibdump            | 6.0.0         | InfiniBand network sniffer                         |
| ibsim             | 0.12          | InfiniBand fabric simulator                        |
| ibarr             | 0.1.3         | InfiniBand Address Resolution Responder            |
| mlnx-tools        | 24.07         | Mellanox firmware management and diagnostic tools  |
| mlx-steering-dump | 1.0.0         | Mellanox steering dump utility                     |
| mlnx-ethtool      | 6.9           | Mellanox-enhanced ethtool utility                  |
| mlnx-iproute2     | 6.9.0         | Mellanox-enhanced iproute2 utility                 |
| perftest          | 24.07.0       | InfiniBand performance tests                       |
| sockperf          | 3.10          | Network benchmarking utility                       |
| ucx               | 1.17.0        | Unified Communication X library                    |
| openmpi           | 4.1.7a1       | High-performance message passing library           |
| mpitests          | 3.2.24        | MPI benchmarks and tests                           |
| libvma            | 9.8.60        | Mellanox Messaging Accelerator library             |
| libxlio           | 3.31.2        | Mellanox Accelerated I/O library                   |
| multiperf         | 3.0           | Network performance testing tool                   |
| openvswitch       | 2.17.8        | Production quality, multilayer virtual switch      |
| iser              | 24.07         | iSCSI Extension for RDMA (iSER) target driver      |
| isert             | 24.07         | iSER target kernel module                          |
| srp               | 24.07         | SCSI RDMA Protocol initiator driver                |
| mlnx-nfsrdma      | 24.07         | NFS over RDMA client driver                        |
| mlnx-nvme         | 24.07         | NVMe over Fabrics host driver                      |
| rshim             | 2.0.41        | Remote System Health Information Module driver     |
| ofed-scripts      | 24.07         | OpenFabrics Enterprise Distribution scripts        |
| ofed-docs         | 24.07         | OpenFabrics Enterprise Distribution documentation  |

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
