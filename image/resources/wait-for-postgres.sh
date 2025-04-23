#!/bin/sh
set -e
echo "######################"
echo "## Waiting Postgres ##"
echo "######################"

until PGPASSWORD="${KONG_PG_PASSWORD}" psql -h "${KONG_PG_HOST}" -p "${KONG_PG_PORT}" -U "${KONG_PG_USER}" -c '\q' ${KONG_PG_DATABASE}; do
  >&2 echo "Postgres is unavailable DB_HOST:${KONG_PG_HOST}, DB_PORT:5432, DB_USERNAME:kong: - sleeping"
  sleep 1
done
