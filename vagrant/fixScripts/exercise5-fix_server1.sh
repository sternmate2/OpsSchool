#!/bin/bash
#add fix to exercise5-server1 here

sudo apt-get update && sudo apt-get install sshpass && sudo -u vagrant ssh-keygen -t rsa -N '' -f /home/vagrant/.ssh/id_rsa &&


cat <<EOT >> /home/vagrant/.ssh/autologin.sh
#!/bin/bash
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no ./.ssh/id_rsa.pub vagrant@192.168.100.11:~/.ssh/s2pub &&
sshpass -p "vagrant" ssh vagrant@192.168.100.11 "cat /home/vagrant/.ssh/s2pub >> /home/vagrant/.ssh/authorized_keys" &&
sudo -u vagrant ssh-keyscan -H 192.168.100.11>>/home/vagrant/.ssh/known_hosts &&
sudo chown vagrant:vagrant /home/vagrant/.ssh/known_hosts && sleep 5 && sudo chmod 755 /home/vagrant/.ssh/autologin.sh
