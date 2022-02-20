Vagrant.configure('2') do |config|
    config.vm.box = 'ubuntu/focal64'
    config.vm.hostname = 'docker.local'
    config.vm.network 'private_network', ip: '192.168.56.2'
    config.vm.network 'forwarded_port', guest: 2375, host: 2375, id: 'dockerd'
    config.vm.provider 'virtualbox' do |vb|
      vb.name = 'ubuntu-docker'
      vb.memory = '4096'
      vb.cpus = '4'
    end
    config.vm.provision 'shell', path: 'provision.sh'
    
    # Configuration for Port Forwarding
    forwarded_ports = [8001]
    forwarded_ports.each do |port|
      config.vm.network 'forwarded_port', guest: port, host: port, id: "port_#{port}"
    end
    config.vm.synced_folder "#{ENV['HOME']}/workspace", "#{ENV['HOME']}/workspace"
end