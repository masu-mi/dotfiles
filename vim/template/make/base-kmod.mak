KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

obj-m := {{_input_:name}}.o
{{_input_:name}}-objs := {{_input_:src_name}}.o

.PHONY: all clean install
all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean

install:
	make -C $(KDIR) M=$(PWD) modules_install
