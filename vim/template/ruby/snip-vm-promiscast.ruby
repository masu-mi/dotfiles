{{_input_:vm}}.provider :virtualbox do |vb|
  (1..{{_input_:vm}}.networks.count).each do |i|
    vb.customize ["modifyvm", :id, "--nicpromisc#{i+1}", "allow-vms"]
  end
end
