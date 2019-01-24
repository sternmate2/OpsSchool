#!/bin/bash
#add fix to exercise3 here

sudo sed -i /'deny from all/c\                allow from all' /etc/apache2/sites-enabled/../sites-available/default &&
#cd / | sudo cp ./vagrant/index.html/index.html /var/www/index.html && 
sudo service apache2 restart

