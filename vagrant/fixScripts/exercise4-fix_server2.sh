#!/bin/bash
#add fix to exercise4-server2 here

sudo sed -i '$ a\192.168.100.10 server1234 server1' /etc/hosts &&

sudo chmod a+w /etc/ssh/ssh_config &&


sudo echo "Host server1
    HostName 192.168.100.10
    User vagrant" >> /etc/ssh/ssh_config &&

sudo service ssh restart
