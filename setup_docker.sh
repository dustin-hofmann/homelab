#!/bin/bash

# 1. Update des Systems
echo "--- Update System ---"
apt update && apt upgrade -y

# 2. Docker installieren (offizielle Methode)
echo "--- Installiere Docker ---"
apt install -y ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 3. Docker Compose alias erstellen (optional)
# Docker Compose ist heute Teil von Docker als 'docker compose' (ohne Bindestrich)
echo "--- Docker fertig! ---"
