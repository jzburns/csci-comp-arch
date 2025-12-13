#!/bin/bash

# once the service is running, open another shell
# and ssh to the raspberry pi using the command
# ssh user@localhost -p 5555
# password is password


# check to see if qemu-system-aarch64 is installed
installed=$(which qemu-system-aarch64)

if [ $? -ne 0 ]; then
	echo "Please install qemu-system-aarch64 first"
	exit 1
fi

# get the required files if they dont exist here

if [ ! -e kernel.img ]; then
	echo "getting the kernel.img file ..."
	curl https://storage.googleapis.com/csci-resources/kernel.img --output kernel.img
	echo "done"
fi

if [ ! -e treeblob.dtb ]; then
	echo "getting the device tree file ..."
	curl https://storage.googleapis.com/csci-resources/treeblob.dtb --output treeblob.dtb 
	echo "done"
fi

if [ ! -e bullseye.img ]; then
	echo "getting the filesystem  ..."
	curl https://storage.googleapis.com/csci-resources/bullseye.img.xz --output bullseye.img.xz
	unxz bullseye.img.xz 
	echo "done"
fi

#	-drive "file=bullseye.img,format=raw,index=0,if=sd" \
# start the emuator running - then use ssh -p 5555 localhost to connect
qemu-system-aarch64 \
	-machine raspi3b \
	-cpu cortex-a72 \
	-smp 4 -m 1G \
	-kernel kernel.img \
	-dtb treeblob.dtb \
	-drive "file=bullseye.img,format=raw,index=0,if=sd" \
	-append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" \
	-device usb-net,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5555-:22 \
	-nographic
