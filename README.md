# Linux lab VMs for Mac M1/M2

This is just a couple of scripts that will start some VMs that you can use for
lab things. Based on Qemu and Debian Bookworm cloud image.

# Prerequsites

1. Install [Homebrew](https://brew.sh)
2. Install dependencies:

```
$ brew install qemu wget
```

# How to run VMs

1. First of all, run `reinit.sh` script. This will download Debian cloud image
and Qemu EFI bios for aarch64. You can run this script again to start from
scratch.

2. Start VMs by running `lab1.sh`, `lab2.sh` or `lab3.sh`. VM will just start
in current terminal session, no graphics support! Default username is `root`
without any password. Kill VM with `Ctrl+A` - `x` sequence.

# Networking?

VMs are bridged with their first NIC to en0 interface. Each VM also has a second
interface, which can only be used to communicate to other VMs.
