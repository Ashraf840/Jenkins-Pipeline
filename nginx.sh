#!/bin/bash

echo "running nginx.sh file"
echo "$PWD"

# shellcheck disable=SC2232
sudo cd -rf app.conf /etc/nginx/conf.d
chmod 710 /var/lib/jenkins/workspace/django_cicd

sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx is started!"

sudo systemctl status nginx
