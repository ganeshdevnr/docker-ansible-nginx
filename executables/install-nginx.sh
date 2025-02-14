#!/bin/sh

echo "Installing NGINX..."
sudo apt update
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl restart nginx

echo "NGINX installation completed on $(hostname)!"
