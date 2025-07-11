#!/usr/bin/env bash
set -e

: "${ADMIN_USER:=admin}"
: "${ADMIN_PASSWORD:=secret}"
: "${DB_FILE:=/data/semaphore.db}"
: "${CONFIG_FILE:=/data/config.json}"

if [ ! -f "$DB_FILE" ]; then
  echo "🎉 First-time setup – generating config and initializing database"

  semaphore setup \
    --config "$CONFIG_FILE" \
    --admin "$ADMIN_USER" \
    --admin-password "$ADMIN_PASSWORD" \
    --admin-name "Home Assistant" \
    --admin-email "ha@example.com" \
    --database-dialect "bolt" \
    --database "$DB_FILE" \
    --tmp-path "/tmp/semaphore" \
    --playbook-path "/tmp/playbooks" \
    --inventory-path "/tmp/inventory" \
    --ssh-key-path "/tmp/keys" \
    --env-path "/tmp/env"

  echo "✅ Config and DB created"
fi

echo "▶️ Starting Semaphore Web UI"
exec semaphore server --config "$CONFIG_FILE"
