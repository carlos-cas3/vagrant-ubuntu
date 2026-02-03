Vagrant.configure("2") do |config|
    config.vm.box = "gusztavvargadr/ubuntu-server"
    config.vm.box_version = "2601.0.0"
    config.vm.box_check_update = false

# Master
    config.vm.define "master" do |master|
        master.vm.hostname = "master"
        master.vm.network "private_network", ip: "10.0.0.1", mac: "080027000001"
        master.vm.provider "virtualbox" do |vb|
            vb.memory = 4096
            vb.cpus = 2
        end
        master.vm.provision "shell", path: "provision_general.sh", name: "general"
    end

# Client1
    config.vm.define "client1" do |client1|
        client1.vm.hostname = "client1"
        client1.vm.network "private_network", ip: "10.0.0.2", mac: "080027000002"
        client1.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 2
        end
        client1.vm.provision "shell", path: "provision_general.sh", name: "general"
    end

# Client2
    config.vm.define "client2" do |client2|
        client2.vm.hostname = "client2"
        client2.vm.network "private_network", ip: "10.0.0.3", mac: "080027000003"
        client2.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 2
        end
        client2.vm.provision "shell", path: "provision_general.sh", name: "general"
    end
end
