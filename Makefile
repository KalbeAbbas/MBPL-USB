#
# Makefile for the qcserial
#

# core layer
obj-m := qcserial.o

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

all:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

debug:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) ccflags-y="-DDEBUG" modules

clean:
	rm -rf *.o *.cmd *.ko *.mod.c .tmp_versions *.o.ur-safe *.symvers *.order .cache.mk .mhi* .built-in* built-in.a *.mod

install:
	sudo cp qcserial.ko /lib/modules/`uname -r`/kernel/drivers/usb/serial/qcserial.ko
	sudo depmod
	

