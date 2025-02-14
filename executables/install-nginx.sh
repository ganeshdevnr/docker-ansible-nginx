#!/bin/sh

echo "Installing NGINX on all Ubuntu servers..."

for host in ubuntu1 ubuntu2 ubuntu3; do
  echo "Connecting to $host..."
  ssh ansible@$host <<EOF
    sudo apt update
    sudo apt install -y nginx
    echo "<h1>Welcome to NGINX on $host</h1>" | sudo tee /var/www/html/index.html
    sudo systemctl enable nginx
    sudo systemctl restart nginx
EOF
done

echo "NGINX installation completed!"
