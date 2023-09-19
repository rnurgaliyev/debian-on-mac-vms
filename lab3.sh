#!/bin/sh

VM_DIR=lab3
NIC1_MAC=52:54:00:ff:03:01
NIC1_HOST_INTERFACE=en0
NIC2_MAC=52:54:00:ff:03:02
NIC2_PRIV_NET_UUID=fafe2624-56d4-11ee-8c99-0242ac120002

sudo qemu-system-aarch64 \
    -machine virt,accel=hvf,highmem=on \
    -bios ./$VM_DIR/QEMU_EFI.fd \
    -cpu host \
    -smp 2 \
    -m 4G \
    -drive if=virtio,format=qcow2,file=./$VM_DIR/disk.qcow2 \
    -nic vmnet-bridged,mac=$NIC1_MAC,ifname=$NIC1_HOST_INTERFACE \
    -nic vmnet-host,mac=$NIC2_MAC,id=labnet,net-uuid=$NIC2_PRIV_NET_UUID \
    -nographic
