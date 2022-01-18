#!/bin/sh
set -e
echo "######################"
echo "## Waiting Postgres ##"
echo "######################"

until PGPASSWORD="${KONG_PG_PASSWORD}" psql -h "${KONG_PG_HOST}" -p 5432 -U "${KONG_DATABASE}" -c '\q'; do
  >&2 echo "Postgres is unavailable DB_HOST:${KONG_PG_HOST}, DB_PORT:5432, DB_USERNAME:kong: - sleeping"
  sleep 1
done
