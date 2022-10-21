#!/bin/bash

echo "running nginx.sh file"
echo "$PWD"

# shellcheck disable=SC2232
sudo cd -rf app.conf /etc/nginx/sites-available/django_cicd
chmod 777 /var/lib/jenkins/workspace/django_cicd

sudo ln -s /etc/nginx/sites-available/django_cicd /etc/nginx/sites-enabled
sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx is started!"

sudo systemctl status nginx
