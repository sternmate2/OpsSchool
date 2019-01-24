#!/bin/bash
#add fix to exercise5-server2 here

sudo apt-get update && sudo apt-get install sshpass && sudo -u vagrant ssh-keygen -t rsa -N '' -f /home/vagrant/.ssh/id_rsa &&

sshpass -p "vagrant" scp -o StrictHostKeyChecking=no ./.ssh/id_rsa.pub vagrant@192.168.100.10:~/.ssh/test.txt &&

sudo -u vagrant ssh-keyscan -H 192.168.100.10>>/home/vagrant/.ssh/known_hosts && sudo chown vagrant:vagrant /home/vagrant/.ssh/known_hosts &&

sshpass -p "vagrant" ssh vagrant@192.168.100.10 "cat /home/vagrant/.ssh/test.txt >> /home/vagrant/.ssh/authorized_keys" &&

sudo -u vagrant sshpass -p "vagrant" ssh vagrant@192.168.100.10 "bash /home/vagrant/.ssh/autologin.sh"
