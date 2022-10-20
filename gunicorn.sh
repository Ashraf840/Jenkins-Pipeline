#!/bin/bash

echo "running gunicorn.sh file"
echo $PWD
echo ls
source env/bin/activate

# Doesn't require to get inside the "app" folder, since the current dir is holding the "manage.py" file.
cd /var/lib/jenkins/workspace/"Django CI-CD"/

python3 manage.py makemigrations
python3 manage.py migrate

echo "Django migrations have been done by gunicorn.sh!"

cd ../

sudo cp -rf gunicorn.scoket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "User: $USER"
echo "Current Directory: $PWD"

sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn has been started!"

sudo systemctl status gunicorn
sudo systemctl restart gunicorn

