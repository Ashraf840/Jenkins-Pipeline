#!/bin/bash

echo "running gunicorn.sh file"
echo "$PWD"
source env/bin/activate

# shellcheck disable=SC2164
cd /var/lib/jenkins/workspace/django_cicd/

python3 manage.py makemigrations
python3 manage.py migrate

echo "Django migrations have been done by gunicorn.sh!"

echo "Present Directory: $PWD"

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "Successfully copied the 'gunicorn.socket' & 'gunicorn.service' files into '/etc/systemd/system/' dir"
echo "User: $USER"
echo "Current Directory: $PWD"

sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn is about to be started!"

sudo systemctl status gunicorn
sudo systemctl restart gunicorn

