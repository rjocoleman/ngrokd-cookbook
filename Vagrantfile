#!/usr/bin/env ruby
#^syntaxBOX detection

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.5.0'
Vagrant.configure('2') do |config|
  config.vm.hostname = 'ngrokd-berkshelf'

  config.vm.network 'private_network', type: 'dhcp'

  config.vm.box = 'chef/ubuntu-14.04'

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      ngrokd: {
        domain: ENV['DOMAIN']
      },
      citadel: {
        access_key_id: ENV['ACCESS_KEY_ID'],
        secret_access_key: ENV['SECRET_ACCESS_KEY'],
        bucket: ENV['BUCKET']
      }
    }
    chef.add_recipe 'ngrokd::default'
  end
end
