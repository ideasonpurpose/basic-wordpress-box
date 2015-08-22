# -*- mode: ruby -*-
# vi: set ft=ruby :

$boxname = "packer-base"
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty32"

  config.vm.network "private_network", ip: "192.168.125.71"

  # prevent key replacement for base builds
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|

    # Give VM access to all cpu cores on the host
    cpus = case RbConfig::CONFIG['host_os']
      when /darwin/ then `sysctl -n hw.ncpu`.to_i
      when /linux/ then `nproc`.to_i
      else 2
    end

    v.customize ["modifyvm", :id, "--name", $boxname]
    v.customize ['modifyvm', :id, '--memory', 1024]
    v.customize ['modifyvm', :id, '--cpus', cpus]
  end

  config.vm.provision "ansible" do |ansible|
    # ansible.verbose = "vvvv"
    ansible.playbook = "ansible/main.yml"
    # Set all Vagrant dependent vars here to override the playbook defaults
    # ansible.extra_vars = {
    #     vagrant: true,
    #     dev: true,
    #     root_user: "vagrant",
    #     admin_user: "vagrant",
    #     site_name: $hostname,
    #     site_root: "/vagrant_synced/" + $hostname,
    # }
  end

end
