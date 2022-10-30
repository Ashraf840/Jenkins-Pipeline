#!/bin/bash

echo "running uwsgi.sh file!"
echo "User: $USER"
echo "Present Dir: $PWD"


sudo systemctl status emperor.uwsgi.service

