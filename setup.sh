#!/bin/bash

#-------------------------------------------------------------------------
# setup.sh - Provision Docker Host Environment on Amazon Linux 2
#
# This script is designed to run on an EC2 instance with Amazon Linux 2
# It performs the following actions:
#   1. Updates the package manager
#   2. Installs Docker and Docker Compose v2
#   3. Starts and enables the Docker service
#   4. Adds ec2-user to the docker group (no sudo needed for Docker)
#   5. Verifies installation
#
# Intended use: Executed via Terraform user_data when EC2 is provisioned
#-------------------------------------------------------------------------

# Exit immediately if any command fails
set -e

# Display start banner
echo "==========================================================="
echo " Starting Docker Host Provisioning Script on Amazon Linux 2"
echo "==========================================================="

# Step 1: Update the package manager to get the Latest package definitions
echo "[1/5] Updating system packages..."
sudo yum update -y

# Step 2: Install Docker from Amazon Linux Extras
# This ensures compatibility with Amazon Linux 2's package ecosystem
echo "[2/5] Installing Docker..."
sudo amazon-linux-extras install docker -y
sudo yum install docker -y

# Step 3: Start the Docker service and enable it to auto-start on boot
echo "[3/5] Enabling and starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Step 4: Add the ec2-user to the docker group so Docker can run without sudo
# NOTE: This takes effect after logout/login or script reboot
echo "[4/5] Granting ec2-user Docker permissions..."
sudo usermod -aG docker ec2-user

# Step 5: Install Docker Compose v2 (plugin-based, not legacy v1 binary)
# This is stored under ~/.docker/cli-plugins/ as recommended by docker
echo "[5/5] Installing Docker Compose v2 plugin..."

DOCKER_COMPOSE_VERSION="v2.24.0"
DOCKER_COMPOSE_PLUGIN_DIR="$HOME/.docker/cli-plugins"

mkdir -p "$DOCKER_COMPOSE_PLUGIN_DIR"

curl -SL "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" \
  -o "${DOCKER_COMPOSE_PLUGIN_DIR}/docker-compose"


chmod +x "${DOCKER_COMPOSE_PLUGIN_DIR}/docker-compose"

# Confirm installation process
echo ""
echo "=================================================="
echo " [+] Docker & Docker Compose installation complete"
echo "=================================================="
docker --version || echo " [!] Docker not detected (may require logout/login)"
docker compose version || echo " [!] Docker Compose not detected (check plugin path)"