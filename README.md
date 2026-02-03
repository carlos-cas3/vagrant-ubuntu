## Requisitos
- Virtualbox
- Vagrant

## Uso
```bash
git clone https://github.com/carlos-cas3/vagrant-ubuntu.git
cd vagrant-ubuntu
vagrant up
````

## Instalar provisions
```bash
vagrant ssh master -c "bash /vagrant/provision_master.sh"
vagrant ssh client1 -c "bash /vagrant/provision_client.sh"
vagrant ssh client2 -c "bash /vagrant/provision_client.sh"
```
Es importante que se monte correctamente el provision_client, esperar si es necesario

## Acceso
```bash
vagrant ssh master
vagrant ssh client1
vagrant ssh client2
```
Comprobar si existe la sincronizacion creando un archivo de prueba

```bash
touch prueba.txt
```
Caso que no aparezca, colocar manualmente en cada client:

```bash
sudo mount master:/home/vagrant/PCyP /home/vagrant/PCyP
```

## Uso con MPI (Solo en el MASTER)

Para ejecutar aplicaciones usando MPI en el clúster (master + clients), siga los pasos a continuación.

### Crear la clave SSH (solo una vez, en el nodo master)

```bash
cd ~/.ssh
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
```
### Copiar la clave pública 

```bash
ssh-copy-id vagrant@client1
ssh-copy-id vagrant@client2
```
- yes (fingerprint)
- password: vagrant


### Verificar acceso SSH sin contraseña 

```bash
ssh client1
ssh client2

```



### Crear archivo hosts

```bash
cd ~/PCyP
touch hosts
```
Dentro del archivo hosts añadir:
```text
master slots=2
client1 slots=2
client2 slots=2

```
Este archivo debe estar en el mismo directorio desde donde se ejecutará mpirun (o indicar su ruta completa al usar --hostfile).



### Probar MPI

```bash
mpirun -np 6 --hostfile hosts hostname
```

## Ejemplo con MPI (MASTER)
Se crea en la carpeta compartida (PCyP):
```bash
touch histograma_mpi.c 
nano histograma_mpi.c 
```

Se copia el código, compila y ejecuta:
```bash
mpicc histograma_mpi.c -o histograma_mpi
mpirun -np 6 --hostfile hosts ./histograma_mpi

```

