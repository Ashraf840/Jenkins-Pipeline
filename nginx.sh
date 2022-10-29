#!/bin/bash

echo "running nginx.sh file"
echo "Present Directory: $PWD"

# Check if nginx_access.log & nginx_error.log exist, otherwise create the files.
if [ -e logs/nginx_access.log ] && [ -e logs/nginx_error.log ]
then
    echo "'nginx_access.log' & 'nginx_error.log' files exist!"
else
    touch logs/nginx_access.log logs/nginx_error.log
    echo "Created the 'nginx_access.log' & 'nginx_error.log' file!"
fi

# shellcheck disable=SC2232
sudo cp -rf multi_apps_1_nginx.conf /etc/nginx/sites-available/multi_apps_1_nginx.conf
chmod 710 /var/lib/jenkins/workspace/multi_app_deploy_1

sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx is started!"

sudo systemctl status nginx