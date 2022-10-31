#!/bin/bash

echo "running uwsgi.sh file!"
echo "User: $USER"
echo "Present Dir: $PWD"

# Install uwsgi in the python env
source env/bin/activate
pip3 install uwsgi

# Check if '/var/lib/jenkins/workspace/multi_app_deploy_3/logs/app2_uwsgi.log' file exist, otherwise create the file
if [ -e /var/lib/jenkins/workspace/multi_app_deploy_3/logs/app2_uwsgi.log ]
then
    echo "app2_uwsgi.log file exists"
else
    echo "app2_uwsgi.log file doesn't exists"
    touch logs/app2_uwsgi.log
    echo "Created the app2_uwsgi.log file into path: $PWD/logs/app2_uwsgi.log"
fi


sudo systemctl daemon-reload
sudo systemctl restart emperor.uwsgi.service
sudo systemctl status emperor.uwsgi.service
