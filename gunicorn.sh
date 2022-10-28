#!/bin/bash

echo "running gunicorn.sh file (App1)"

NAME="dj_app1"                                                           # Name of the application
DJANGODIR=/var/lib/jenkins/workspace/multi_app_deploy_1                     # Django project directory
SOCKFILE=/var/lib/jenkins/workspace/multi_app_deploy_1/run/gunicorn.sock         # we will communicate using this unix socket
USER=jenkins                                                          # the user to run as
NUM_WORKERS=3                                                         # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=app.settings                                   # which settings file should Django use
DJANGO_WSGI_MODULE=app.wsgi                                           # WSGI module name

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
echo "$PWD"
