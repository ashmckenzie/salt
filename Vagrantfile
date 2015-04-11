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
      salt.install_args = ENV.fetch('SALTSTACK_GIT_RELEASE', 'v2014.7.4')

      salt.install_master = true
      salt.master_config = 'vagrant/config/master'
      salt.minion_config = 'vagrant/config/minion'

      salt.master_key = 'vagrant/config/pki/master.pem'
      salt.master_pub = 'vagrant/config/pki/master.pub'
      salt.minion_key = 'vagrant/config/pki/master-minion.pem'
      salt.minion_pub = 'vagrant/config/pki/master-minion.pub'

      salt.seed_master = {
        'master1' => 'vagrant/config/pki/master-minion.pub',
        'minion1' => 'vagrant/config/pki/minion.pub'
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
      salt.install_args = ENV.fetch('SALTSTACK_GIT_RELEASE', 'v2014.7.4')

      salt.run_highstate = false
      salt.minion_config = 'vagrant/config/minion'

      salt.minion_key = 'vagrant/config/pki/minion.pem'
      salt.minion_pub = 'vagrant/config/pki/minion.pub'
    end
  end
end
