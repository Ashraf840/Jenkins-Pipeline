#!/bin/bash

echo "running gunicorn_start.sh file (App1)"

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
source env/bin/activate

# These variables will be used by the new shell, export will make the variables global
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the 'run' directory if it doesn't exist, '-d' represents directory
#RUNDIR=$(dirname $SOCKFILE)
ehco "Gunicorn socket file run path: $RUNDIR"
#test -d $RUNDIR || mkdir -p $RUNDIR

if [ -d $DJANGODIR/run ]
then
  echo "run folder exists"
else
  mkdir run
fi

# Monetize multiple Gunicorn-powered applications running on the same server
sudo apt install python3-dev
pip install setproctitle

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
# Rather for putting the 'gunicorn.socket' & 'gunicorn.service' files into systemd/system folder,
# instead of running each dj-apps gunicorn separately.
exec $DJANGODIR/env/bin/gunicorn \
  --error-logfile $DJANGODIR/error.log \
  --name $NAME \
  --workers $NUM_WORKERS \
  --capture-output --log-level debug \
  --user=$USER \
  --bind=unix:$SOCKFILE \
  ${DJANGO_WSGI_MODULE}:application

