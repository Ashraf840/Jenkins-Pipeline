#!/bin/bash

echo "running gunicorn.sh file (App1)"
echo "User: $USER"

DJANGODIR=/var/lib/jenkins/workspace/multi_app_deploy_1

echo "Present Directory: $PWD"
source env/bin/activate

# shellcheck disable=SC2164
cd $DJANGODIR

python3 manage.py makemigrations
python3 manage.py migrate

echo "Django migrations have been done while executing gunicorn.sh!"

echo "Present Directory: $PWD"

# Make the gunicorn_server.sh executable
chmod u+x gunicorn_start.sh

# Copy 'gunicorn_start.sh' file to the env/bin/ path of this django-project directory
sudo cp -rf gunicorn_start.sh $DJANGODIR/env/bin/

echo "Copied the gunicorn_start.sh file into path: $DJANGODIR/env/bin/"