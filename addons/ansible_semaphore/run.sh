#!/usr/bin/env bash
set -e

CONFIG_FILE=/data/config.json

if [ ! -f "$CONFIG_FILE" ]; then
  echo "❌ Config not found: $CONFIG_FILE"
  exit 1
fi

echo "▶️ Starting Semaphore with config at $CONFIG_FILE"
exec semaphore server --config "$CONFIG_FILE"
