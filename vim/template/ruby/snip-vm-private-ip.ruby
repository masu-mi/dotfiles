ops_ip_env_name = "VM_OPS_#{node.vm.hostname}_IP"
node.vm.network "private_network",
  ip: ENV["VM_OPS_IP"] ||
      ENV[ops_ip_env_name] ||
      "172.16.0.10"
