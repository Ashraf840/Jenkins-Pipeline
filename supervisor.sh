#!/bin/bash

echo "running supervisor.sh file (App1)"

echo "Present Directory: $PWD"

sudo apt install supervisor

# Copy 'multi_apps_1.supervisor.conf' file into '/etc/supervisor/conf.d/' dir, thus supervisor can run the
# shell-script to start this django-apps gunicorn particularly.
sudo cp -rf multi_apps_1.supervisor.conf /etc/supervisor/conf.d/multi_apps_1.supervisor.conf

# Check if supervisor.log exist, otherwise create the file. This file is used inside the 'multi_apps_1.supervisor.conf' file
if [ -e logs/gunicorn_supervisor.log ]
then
    echo "'gunicorn_supervisor.log' file exist!"
else
    touch logs/gunicorn_supervisor.log
    echo "Created the 'gunicorn_supervisor.log' file!"
fi


sudo supervisorctl start multi_dj_app1.supervisor
sudo supervisorctl status multi_dj_app1.supervisor