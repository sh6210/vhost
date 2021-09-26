read -p "May i know the virtual host name?* " VHOST
read -p "May i know the root directory name? " ROOT_DIR

filepath="$HOME/mine/bash/vhost_sample.txt"

echo "\n Creating conf file inside /etc/apache2/sites-available"
sudo touch /etc/apache2/sites-available/$VHOST.conf

echo "\n Running chown to the conf file"
sudo chown "$USER":"$USER" /etc/apache2/sites-available/$VHOST.conf

echo "\n Filling with virtual host content"
head -n 20 $HOME/mine/bash/vhost_sample.txt > /etc/apache2/sites-available/$VHOST.conf

sudo sed -i "s/test/$VHOST/" /etc/apache2/sites-available/$VHOST.conf
sudo sed -i "s/project_root_dir/$ROOT_DIR/" /etc/apache2/sites-available/$VHOST.conf

echo "\n Writing to /etc/hosts"
echo " " >> /etc/hosts
echo "127.0.0.1    $VHOST.loc" >> /etc/hosts

echo "\n Activating $VHOST"
sudo a2ensite $VHOST.conf
sudo service apache2 restart

if [ -d "/var/www/html/$VHOST" ]
then
   echo "\n Found $VHOST directory." 
else
    echo "\n creating directory $VHOST"
    mkdir /var/www/html/$VHOST
    chown "$USER":"$USER" /var/www/html/$VHOST
fi

echo "\ndone, your virtual host $VHOST is ready to serve."
