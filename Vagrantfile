Vagrant.configure(2) do |config|
  config.vm.synced_folder '.', '/srv/salt/'
  config.vm.provision :shell, path: 'vagrant/bootstrap.sh'
  config.vm.provider('virtualbox') { |vb| vb.memory = '512' }
  config.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')

  config.vm.define 'master1' do |instance|
    instance.vm.hostname = 'master1'
    instance.vm.box = 'ubuntu14.04'
    instance.vm.network :private_network, ip: '192.168.37.20'

    instance.vm.provision :salt do |salt|
      salt.verbose = true
      salt.colorize = true
      salt.log_level = 'debug'
      salt.bootstrap_options = '-D -K -p python-dateutil'
      salt.install_type = 'git'
      salt.install_args = ENV.fetch('SALTSTACK_GIT_RELEASE', 'v2015.2.0rc2')

      salt.install_master = true
      salt.master_config = 'vagrant/master'
      salt.minion_config = 'vagrant/minion'

      salt.master_key = 'vagrant/pki/master.pem'
      salt.master_pub = 'vagrant/pki/master.pub'
      salt.minion_key = 'vagrant/pki/master-minion.pem'
      salt.minion_pub = 'vagrant/pki/master-minion.pub'

      salt.seed_master = {
        'master1' => 'vagrant/pki/master-minion.pub',
        'minion1' => 'vagrant/pki/minion.pub'
      }
    end
  end

  config.vm.define 'minion1' do |instance|
    instance.vm.hostname = 'minion1'
    instance.vm.box = 'ubuntu14.04'
    instance.vm.network :private_network, ip: '192.168.37.21'

    instance.vm.provision :salt do |salt|
      salt.verbose = true
      salt.colorize = true
      salt.log_level = 'debug'
      salt.bootstrap_options = '-D -K -p python-dateutil'
      salt.install_type = 'git'
      salt.install_args = ENV.fetch('SALTSTACK_GIT_RELEASE', 'v2015.2.0rc2')

      salt.run_highstate = false
      salt.minion_config = 'vagrant/minion'
      salt.minion_key = 'vagrant/pki/minion.pem'
      salt.minion_pub = 'vagrant/pki/minion.pub'
    end
  end
end
