#!/usr/bin/env bash
set -e

echo "Testing write permission in /data..."
ls -l /data
touch /data/testfile && rm /data/testfile
echo "Write test passed"

CONFIG_PATH="/data/config.json"
DB_PATH="/data/semaphore.db"

generate_random_key() {
  openssl rand -hex 16
}

if [ ! -f "$CONFIG_PATH" ]; then
  echo "⚙️ Config not found, generating new config at $CONFIG_PATH"

  cat > "$CONFIG_PATH" << EOF
{
  "bolt": {
    "path": "$DB_PATH"
  },
  "web_host": "0.0.0.0:3000",
  "tmp_path": "/tmp/semaphore",
  "cookie_hash": "$(generate_random_key)",
  "cookie_encryption": "$(generate_random_key)",
  "access_key_encryption": "$(generate_random_key)",
  "email_alert": false,
  "ldap_enable": false
}
EOF

  echo "✅ Config generated"
fi

echo "▶️ Starting Semaphore server"
exec semaphore server --config "$CONFIG_PATH"
