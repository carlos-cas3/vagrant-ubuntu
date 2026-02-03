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

## Acceso
```bash
vagrant ssh master
vagrant ssh client1
vagrant ssh client2
```


## Uso con MPI (MASTER)

Para ejecutar aplicaciones usando MPI en el clúster (master + clients), siga los pasos a continuación.

### Crear la clave SSH (solo una vez, en el nodo master)

```bash
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
```
### Copiar la clave pública 

```bash
ssh-copy-id vagrant@client1
ssh-copy-id vagrant@client2
```
- yes fingerprint 
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

### Ejemplo
Buscar en la carpeta llamada Ejemplo

```bash
touch histograma_mpi.c 
nano histograma_mpi.c 
mpicc histograma_mpi.c -o histograma_mpi
mpirun -np 6 --hostfile hosts ./histograma_mpi
```

