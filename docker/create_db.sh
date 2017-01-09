#!/usr/bin/env bash

dcd='docker-compose'
dcp='docker-compose -f docker-compose.yml -f production.yml'

if [ $# -eq 0 ]
  then
    echo "Use -d or -p"
    exit 1
fi

# idiomatic parameter and option handling in sh
while test $# -gt 0
do
    case "$1" in
        -p) echo "Production"
            dc=$dcp
            ;;
        -d) echo "Development"
            dc=$dcd
            ;;
        -*) echo "bad option $1"
            ;;
        *) echo "argument $1"
            ;;
    esac
    shift
done

$dc build

$dc run --rm web python manage.py migrate
$dc run --rm web python manage.py createsuperuser

