#!/bin/bash

echo "running supervisor.sh file (App1)"

echo "Present Directory: $PWD"

# Check if supervisor.log exist, otherwise create
if [ -e logs/gunicorn_supervisor.log ]
then
    echo "'gunicorn_supervisor.log' file exist!"
else
    touch logs/gunicorn_supervisor.log
    echo "Created the 'gunicorn_supervisor.log' file!"
fi




