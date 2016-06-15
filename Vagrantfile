# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT
mkdir /srv/pillar
test -f /tmp/travis/top.sls && cp /{tmp/travis,srv/salt}/top.sls
cp /{tmp/travis,srv/pillar}/top.sls 
cp /srv/{salt/pillar.example,pillar/monit.sls}
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.define "local" do |local|
    local.vm.box = "stingA0815/archlinux-rex"
    
    local.vm.synced_folder ".", "/vagrant", disabled: true
    local.vm.synced_folder ".", "/srv/salt"
    local.vm.synced_folder ".travis", "/tmp/travis"

    local.vm.provision "shell", inline: $script
    local.vm.provision :salt do |salt|
      salt.bootstrap_script = "../salt-bootstrap/bootstrap-salt.sh"
      salt.masterless = true
      salt.minion_config = ".travis/minion"
      salt.run_highstate = false
      salt.colorize = true
      salt.verbose = true
      salt.log_level = "warning" 
    end
  end
end
