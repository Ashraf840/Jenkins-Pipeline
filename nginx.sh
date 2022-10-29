#!/bin/bash

echo "running nginx.sh file"
echo "Present Directory: $PWD"

# Check if supervisor.log exist, otherwise create the file. This file is used inside the 'multi_apps_1.supervisor.conf' file
if [ -e logs/nginx_access.log ] && [ -e logs/nginx_error.log ]
then
    echo "'nginx_access.log' & 'nginx_error.log' files exist!"
else
    touch logs/nginx_access.log logs/nginx_error.log
    echo "Created the 'nginx_access.log' & 'nginx_error.log' file!"
fi

