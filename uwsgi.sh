#!/bin/bash

echo "running uwsgi.sh file!"
echo "User: $USER"
echo "Present Dir: $PWD"

# Install uwsgi in the python env
source env/bin/activate
pip3 install uwsgi

# Check if the 'vassals' dir exists, otherwise create the dir
if [ -d /etc/uwsgi/vassals ]
then
    echo "vassals dir exists"
else
    echo "vassals dir doesn't exists"
    sudo mkdir /etc/uwsgi/vassals
fi

# Check if the '/etc/uwsgi/emperor.ini' file exists, otherwise create the dir
if [ -e /etc/uwsgi/emperor.ini ]
then
    echo "emperor.ini dir exists"
else
    echo "emperor.ini dir doesn't exists"
    sudo cp -rf emperor.ini /etc/uwsgi/emperor.ini
fi

sudo systemctl status emperor.uwsgi.service

