#!/bin/bash

NAME="app1"                                                           # Name of the application
DJANGODIR=/var/lib/jenkins/workspace/django_cicd/                     # Django project directory
SOCKFILE=/var/lib/jenkins/workspace/django_cicd/gunicorn.sock         # we will communicate using this unix socket
USER=jenkins                                                          # the user to run as
NUM_WORKERS=3                                                         # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=app.settings                                   # which settings file should Django use
DJANGO_WSGI_MODULE=app.wsgi                                           # WSGI module name

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
source env/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec env/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --bind=unix:$SOCKFILE \
  --log-level=debug \
  --log-file=-