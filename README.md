## Requisitos
- Virtualbox
- Vagrant

## Uso
- git clone <repo>
- cd <repo>
- vagrant up


## Instalar provisions
- vagrant ssh master -c "bash /vagrant/provision_master.sh"
- vagrant ssh client1 -c "bash /vagrant/provision_client.sh"
- vagrant ssh client2 -c "bash /vagrant/provision_client.sh"

## Acceso
- vagrant ssh master
- vagrant ssh client1
- vagrant ssh client2

