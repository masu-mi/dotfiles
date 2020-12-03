v.customize ["modifyvm", :id, "--uart1", "0x3f8", "4"]
# ref. https://www.virtualbox.org/manual/ch03.html#serialports
v.customize ["modifyvm", :id, "--uartmode1", "server", "/tmp/#{node.vm.hostname}_com"]
