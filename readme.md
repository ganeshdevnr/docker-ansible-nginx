# 🚀 Ansible + NGINX + Docker Load Balancer

This project automates the setup of multiple Ubuntu-based NGINX servers using **Ansible** and **Docker Compose**. It also includes an **NGINX load balancer** to distribute traffic across the servers.

---

## 📌 Prerequisites

Before running this setup, ensure you have:

- **Docker & Docker Compose** installed
- **Git Bash / WSL / PowerShell** (if using Windows)
- **Ansible** (installed inside the `ansible_container`)

---

## 🚀 Getting Started

### **1️⃣ Start the Containers**

Run the following command to build and start all containers:

```sh
docker-compose up -d --build
```

This will:
✅ Build the **Ansible container**
✅ Set up **three Ubuntu NGINX servers** (`ubuntu1`, `ubuntu2`, `ubuntu3`)
✅ Start an **NGINX Load Balancer (`nginx-lb`)**

---

### **2️⃣ Access the Ansible Container**

Once the containers are running, enter the **Ansible container**:

```sh
docker exec -it ansible_container sh
```

Now, you're inside the container and can run Ansible commands.

---

### **3️⃣ Setup SSH for Ansible**

Inside the `ansible_container`, configure passwordless SSH for Ansible:

```sh
sh /executables/setup-ssh.sh
```

This will:
✅ Generate SSH keys (if missing)
✅ Copy the SSH keys to `ubuntu1`, `ubuntu2`, and `ubuntu3`
✅ Ensure **Ansible can connect without passwords**

---

### **4️⃣ Run the Ansible Playbook**

Now, install and configure NGINX on all Ubuntu servers:

```sh
ansible-playbook -i /ansible_playbooks/inventory /ansible_playbooks/install-ubuntu.yml
```

This will:
✅ Install **NGINX** on all Ubuntu servers
✅ Apply the **NGINX config** from `nginx-config/`
✅ Ensure all servers **serve files from the shared `src/` folder**

---

## 🌐 Access the Web Servers

Once everything is set up, you can access the **web servers** and **load balancer**:

| Server        | URL                                            |
| ------------- | ---------------------------------------------- |
| Ubuntu 1      | [http://localhost:8081](http://localhost:8081) |
| Ubuntu 2      | [http://localhost:8082](http://localhost:8082) |
| Ubuntu 3      | [http://localhost:8083](http://localhost:8083) |
| Load Balancer | [http://localhost:8080](http://localhost:8080) |

The **load balancer (`nginx-lb`)** will automatically distribute traffic across all three servers.

---

## 📂 Project Structure

```
.
├── ansible_playbooks/
│   ├── install-ubuntu.yml        # Ansible playbook for installing NGINX
│   ├── inventory                 # List of Ubuntu servers
├── dockerfiles/
│   ├── ansible.dockerfile        # Defines Ansible container setup
│   ├── ubuntu.dockerfile         # Defines Ubuntu container setup
├── executables/
│   ├── setup-ssh.sh              # SSH setup script for Ansible
│   ├── install-nginx.sh          # Script to install & start NGINX
├── nginx-config/
│   ├── default.conf              # NGINX configuration (shared)
├── src/
│   ├── index.html                # Shared web content
├── docker-compose.yml            # Docker setup
├── README.md                     # Documentation
```

---

## 🔄 Stopping & Restarting

To stop all containers:

```sh
docker-compose down
```

To start everything again:

```sh
docker-compose up -d
```

To **rebuild everything** from scratch:

```sh
docker-compose up -d --build
```

---

## 🔧 Troubleshooting

### **Check if NGINX is Running**

Inside any **Ubuntu server** (`ubuntu1`, `ubuntu2`, or `ubuntu3`):

```sh
service nginx status
```

or

```sh
curl -I http://localhost
```

### **Restart NGINX if Needed**

```sh
sudo service nginx restart
```

### **Check Docker Logs**

```sh
docker logs nginx_lb
```

---

## 📢 Contributing

If you have improvements, feel free to open an issue or submit a PR. 🚀

---

## 💡 Author

Developed by **Ganesh** – Because automation is awesome! 😎
