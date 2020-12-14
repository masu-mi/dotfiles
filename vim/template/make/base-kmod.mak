obj-m = {{_input_:name}}.o
{{_input_:name}}-objs := {{_input_:src_name}}.o

PWD := $(shell pwd)

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
