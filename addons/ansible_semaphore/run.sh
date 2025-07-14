#!/usr/bin/env bash
set -e

CONFIG_PATH="/data/config.json"
DB_PATH="/data/semaphore.db"

generate_random_key() {
  openssl rand -hex 16
}

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

if [ ! -f "$CONFIG_PATH" ]; then
  log "⚙️ Config not found, generating new config at $CONFIG_PATH"

  cat > "$CONFIG_PATH" << EOF
{
  "bolt": {
    "host": "$DB_PATH"
  },
  "dialect": "bolt",
  "port": "3100",
  "tmp_path": "/tmp/semaphore",
  "cookie_hash": "$(generate_random_key)",
  "cookie_encryption": "$(generate_random_key)",
  "access_key_encryption": "$(generate_random_key)"
}
EOF

  log "📧 Creating admin user"

  semaphore user add --admin \
    --login admin \
    --password password \
    --name "Admin" \
    --email "admin@localhost" \
    --config "$CONFIG_PATH"

  log "✅ Config and admin user created"
fi

#log "🌐 Starting nginx reverse proxy"
#nginx

log "▶️ Starting Semaphore server on port 3100"
exec semaphore server --log-level DEBUG --config "$CONFIG_PATH"
