#!/bin/bash
#add fix to exercise4-server1 here

sudo sed -i '$ a\192.168.100.11 server2 server2' /etc/hosts &&


<<-EOT cat >> /etc/ssh/ssh_config

Host server2
    HostName 192.168.100.11
    User vagrant
EOT

sudo service ssh restart
