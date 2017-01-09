#!/bin/sh
python manage.py collectstatic --noinput
/usr/local/bin/gunicorn django_docker.wsgi:application -w 2 -b :8000 --reload