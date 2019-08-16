#!/bin/sh
# generate output for GPU related items
# Designed for AMD GPUs

mkdir output

dkms status > output/dkms.status.log
lsmod | grep amdgpu > output/lsmod.amdgpu.log
dmesg > output/dmesg.log
lspci -vnn > output/lspci.vnn.log
lspci -nn > output/lspci.nn.log
sudo dmidecode > output/dmidecode.log
uname -a > output/uname.a.log
lsinitramfs /boot/initrd.img-`uname -r` > output/lsinitramfs.log
sudo lshw > output/lshw.log
modinfo amdgpu > output/modinfo.amdgpu.log
glxinfo > output/glxinfo.log

cat output/* > SystemInfo.md

rm -rf output
