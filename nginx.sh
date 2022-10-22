#!/bin/bash

echo "running nginx.sh file"
echo "Present Directory: $PWD"

# shellcheck disable=SC2232
sudo cp -rf django_cicd.conf /etc/nginx/sites-available/django_cicd.conf
chmod 710 /var/lib/jenkins/workspace/django_cicd

sudo ln -s /etc/nginx/sites-available/django_cicd.conf /etc/nginx/sites-enabled
sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx is started!"

sudo systemctl status nginx
