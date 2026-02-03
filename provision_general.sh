#!/bin/bash
set -e

TARGET_USER=vagrant
USER_HOME=$(eval echo "~$TARGET_USER")

# -------------------------
# 1. Instalar paquetes comunes
# -------------------------
apt-get update
apt-get install -y net-tools openmpi-bin openmpi-common libopenmpi-dev openmpi-doc \
    openssh-client openssh-server nfs-common nfs-kernel-server

# -------------------------
# 2. Configurar /etc/hosts
# -------------------------
cat >> /etc/hosts <<EOL
10.0.0.1 master
10.0.0.2 client1
10.0.0.3 client2
EOL

# -------------------------
# 3. Hostname (ya lo define Vagrant, esto es redundante)
# -------------------------
sudo hostnamectl set-hostname "$(hostname)"

# -------------------------
# 4. Reiniciar SSH
# -------------------------
systemctl restart ssh

# -------------------------
# 5. Crear .ssh para vagrant
# -------------------------
mkdir -p "$USER_HOME/.ssh"
chmod 700 "$USER_HOME/.ssh"
chown -R "$TARGET_USER:$TARGET_USER" "$USER_HOME/.ssh"

# -------------------------
# 6. Crear carpeta PCyP para vagrant
# -------------------------
mkdir -p "$USER_HOME/PCyP"
chown -R "$TARGET_USER:$TARGET_USER" "$USER_HOME/PCyP"
