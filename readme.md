```bash

docker-compose up -d --build

docker exec -it ansible_container sh

sh /executables/setup-ssh.sh

ansible-playbook -i /ansible_playbooks/inventory /ansible_playbooks/install-ubuntu.yml

```
