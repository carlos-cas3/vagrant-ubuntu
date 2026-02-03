## Requisitos
- Virtualbox
- Vagrant

## Uso
```bash
- git clone https://github.com/carlos-cas3/vagrant-ubuntu.git
- cd vagrant-ubuntu
- vagrant up
````

## Instalar provisions
```bash
- vagrant ssh master -c "bash /vagrant/provision_master.sh"
- vagrant ssh client1 -c "bash /vagrant/provision_client.sh"
- vagrant ssh client2 -c "bash /vagrant/provision_client.sh"
```

## Acceso
```bash
- vagrant ssh master
- vagrant ssh client1
- vagrant ssh client2
```
