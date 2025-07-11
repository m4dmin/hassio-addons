#!/usr/bin/env bash
set -e

: "${ADMIN_USER:=admin}"
: "${ADMIN_PASSWORD:=secret}"
: "${DB_NAME:=/data/semaphore.db}"

# If the database file does not exist, perform first-time setup
if [ ! -f "${DB_NAME}" ]; then
  echo "🎉 First-time setup – creating admin user and database"
  semaphore setup --db "${DB_NAME}" --user "${ADMIN_USER}" --pass "${ADMIN_PASSWORD}"
fi

echo "▶️ Starting Semaphore Web UI"
exec semaphore server --db "${DB_NAME}"
