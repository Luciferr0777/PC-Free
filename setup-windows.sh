#!/bin/bash
# PC-Free bootstrap for GitHub Codespaces.
# Run once inside a fresh Codespace:  bash setup-windows.sh
set -e

echo "==> Checking Docker"
if ! command -v docker >/dev/null; then
  echo "Docker not found. Use a Codespace (docker preinstalled)." >&2
  exit 1
fi
docker info >/dev/null 2>&1 || { echo "Docker daemon not running." >&2; exit 1; }

echo "==> Preparing data directory"
sudo mkdir -p /tmp/docker-data
sudo chmod 777 /tmp/docker-data

echo "==> Preparing .env"
if [ ! -f .env ]; then
  cp .env.example .env
  echo "Created .env from .env.example — EDIT IT before first boot:"
  echo "  nano .env"
else
  echo ".env already exists"
fi

echo "==> Starting Windows 10"
docker-compose -f windows10.yml up -d

echo "==> Status"
docker ps --filter name=windows --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
echo
echo "Open port 8006 in the Codespace 'Ports' tab (set visibility to Public)."
echo "First boot downloads ~4GB and takes 5-10 minutes."
echo "Logs: docker logs -f windows"
