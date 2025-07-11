#!/usr/bin/env bash
set -e

echo "📁 Add-on Data Directory: /data"
export SEMAPHORE_DB_DIALECT=bolt
export SEMAPHORE_BOLT_PATH=/data/semaphore.db

export SEMAPHORE_ADMIN="${SEMAPHORE_ADMIN}"
export SEMAPHORE_ADMIN_PASSWORD="${SEMAPHORE_ADMIN_PASSWORD}"
export SEMAPHORE_ADMIN_NAME="${SEMAPHORE_ADMIN_NAME}"
export SEMAPHORE_ADMIN_EMAIL="${SEMAPHORE_ADMIN_EMAIL}"

echo "▶️ Starting Ansible Semaphore..."
exec semaphore server
