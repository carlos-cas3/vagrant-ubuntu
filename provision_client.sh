#!/bin/bash
set -e

sudo mount master:/home/vagrant/PCyP /home/vagrant/PCyP || true

if ! grep -q PCyP /etc/fstab; then
  echo "master:/home/vagrant/PCyP /home/vagrant/PCyP nfs defaults 0 0" | sudo tee -a /etc/fstab
fi

echo "Cliente listo."
