#!/bin/bash

qemu-system-aarch64   -machine virt   -cpu cortex-a57 -m 4096 -smp 4   \
				-drive if=pflash,format=raw,unit=0,readonly=on,file=flash0-code.img   \
				-drive if=pflash,format=raw,unit=1,file=flash1-vars.img   \
				-drive file=debian-arm64.qcow2,if=virtio,format=qcow2   \
				-netdev user,id=n0,hostfwd=tcp::2222-:22   \
				-device virtio-net-pci,netdev=n0
