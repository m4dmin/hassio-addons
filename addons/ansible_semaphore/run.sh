#!/usr/bin/env bash
set -e

CONFIG_PATH="/data/config.json"

if [ ! -f "$CONFIG_PATH" ]; then
  echo "❌ config.json not found in $CONFIG_PATH"
  exit 1
fi

echo "✅ Found config, starting Ansible Semaphore..."
exec semaphore server --config "$CONFIG_PATH"
