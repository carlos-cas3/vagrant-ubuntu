#!/bin/bash
set -e

# -------------------------
# 2. Configurar NFS exports
# -------------------------
sudo bash -c 'cat > /etc/exports <<EOF
/home/vagrant/PCyP client1(rw,sync,no_subtree_check)
/home/vagrant/PCyP client2(rw,sync,no_subtree_check)
EOF'

sudo exportfs -ra
sudo systemctl restart nfs-kernel-server
sudo systemctl enable nfs-kernel-server

echo "Master listo."
