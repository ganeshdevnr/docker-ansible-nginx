#!/bin/sh

echo "Installing NGINX..."
sudo apt update
sudo apt install -y nginx
echo "<h1>Welcome to NGINX on $(hostname)</h1>" | sudo tee /var/www/html/index.html
sudo systemctl enable nginx
sudo systemctl restart nginx

echo "NGINX installation completed on $(hostname)!"
