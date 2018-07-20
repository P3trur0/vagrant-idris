#provisioning constants
VHM_BOX_NAME = "vagrant-idris"
VHM_MEMORY   = 3000
VHM_NUM_CPUS = 2

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.synced_folder "./", "/vagrant"
    # Removes "stdin: is not a tty" annoyance as per
	# https://github.com/SocialGeeks/vagrant-openstack/commit/d3ea0695e64ea2e905a67c1b7e12d794a1a29b97
	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

    config.vm.define "#{VHM_BOX_NAME}", primary: true do |b|
        b.vm.provider :virtualbox do |virtualbox, override|
           virtualbox.name = "#{VHM_BOX_NAME}"
           virtualbox.memory = "#{VHM_MEMORY}".to_i
           virtualbox.cpus = "#{VHM_NUM_CPUS}".to_i
           override.vm.hostname = "#{VHM_BOX_NAME}"

           #utilities setup
           config.vm.provision "file", source: "util/utils.sh", destination: "/home/vagrant/utils.sh"

           #preliminary provisioning
           override.vm.provision :shell, :path => "privileged_operations.sh"
           #idris installation for vagrant user
           override.vm.provision :shell, :path => "idris.sh", privileged: false 
        end
    end
end
