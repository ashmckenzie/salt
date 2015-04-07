Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu14.04'
  config.vm.synced_folder '.', '/srv/salt/'

  config.vm.provision :salt do |salt|
    salt.minion_config = 'config/minion_local'
    salt.install_type = 'git'
    salt.install_args = 'v2015.2.0rc2'
    salt.run_highstate = true
    salt.log_level = 'debug'
  end
end
