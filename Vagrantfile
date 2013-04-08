# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'json'

Vagrant::Config.run do |config|
  config.vm.define :djangovm do |cfg|
    # Every Vagrant virtual environment requires a box to build off of.
    cfg.vm.box = "precise64"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    cfg.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Forward a port from the guest to the host, which allows for outside
    # computers to access the VM, whereas host only networking does not.
    cfg.vm.forward_port 80, 8080
    # To access our website, we can open a web browser on our workstation 
    # and go to http://localhost:8001. 
    cfg.vm.forward_port 8000, 8001

    # Enable provisioning with chef solo, specifying a cookbooks path 
    # (relative to this Vagrantfile), and adding some recipes and/or 
    # roles.
    #

    VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'vagrant.json').read)
    
    cfg.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.provisioning_path = "/tmp/vagrant-chef"

      chef.json = VAGRANT_JSON
      VAGRANT_JSON['run_list'].each do |recipe|
        chef.add_recipe(recipe)
      end if VAGRANT_JSON['run_list']
      
      # tie it all together
      #chef.add_recipe "riley-project"
    end
  end
end