#!/bin/sh

DEBIAN_IMAGE_URL=https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-nocloud-arm64.qcow2
DEBIAN_IMAGE_PATH=./debian.qcow2

BIOS_IMAGE_URL=http://ftp.de.debian.org/debian/pool/main/e/edk2/qemu-efi-aarch64_2022.11-6_all.deb
BIOS_IMAGE_PATH=./bios.deb

echo "🍣  Downloading debian image"
wget -q $DEBIAN_IMAGE_URL -O $DEBIAN_IMAGE_PATH

echo "🍣  Downloading qemu aarch64 bios"
wget -q $BIOS_IMAGE_URL -O $BIOS_IMAGE_PATH

for lab in lab1 lab2 lab3; do
    echo "🍣  Preparing $lab"
    rm -fr $lab 2> /dev/null
    mkdir -p $lab
    cp $DEBIAN_IMAGE_PATH $lab/disk.qcow2
    tar xOf $BIOS_IMAGE_PATH data.tar.xz | tar xJO usr/share/qemu-efi-aarch64/QEMU_EFI.fd > $lab/QEMU_EFI.fd
done

rm -fr $DEBIAN_IMAGE_PATH $BIOS_IMAGE_PATH
