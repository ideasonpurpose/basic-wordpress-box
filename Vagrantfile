# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# version 1.2.1

$boxname = "packer-base"
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty32"

  # disable vagrant-hostmanager if it's installed
  config.hostmanager.enabled = false if Vagrant.has_plugin? 'vagrant-hostmanager'

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
    # ansible.verbose = "vvvv"  # for debugging Ansible playbooks
    ansible.playbook = "ansible/main.yml"
  end

end

