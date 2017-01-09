#!/usr/bin/env bash
# wait_for_postgres.sh

set -e

host="$1"
shift
cmd="$@"

# Wait for the db service to be ready before continuing
echo "waiting for db..."
while ! nc -w 1 -z $DB_HOST $DB_PORT 2>/dev/null;
do
  echo -n .
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd