#!/bin/bash

sh scripts/clone-data-if-empty.sh

python manage.py makemigrations dashboard
python manage.py migrate

python manage.py runserver 0:8000