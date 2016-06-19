# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT
test -d /srv/pillar || mkdir /srv/pillar
test -f /tmp/travis/top.sls && cp /{tmp/travis,srv/salt}/top.sls
cp {/tmp/travis,/srv/salt}/top.sls
cp /tmp/travis/top_pillar.sls /srv/pillar/top.sls
cp /srv/{salt/pillar.example,pillar/monit.sls}
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.define "xenial" do |xenial|
    xenial.vm.box = "xenial"
    
    xenial.vm.synced_folder ".", "/vagrant", disabled: true
    xenial.vm.synced_folder ".", "/srv/salt"
    xenial.vm.synced_folder ".travis", "/tmp/travis"

    xenial.vm.provision "shell", inline: $script
    xenial.vm.provision :salt do |salt|
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
