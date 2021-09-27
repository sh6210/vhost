### Create virtual host in one go...

> Check **_hosts_** file has the appropriate permission, if not then run

`chown "$USER":"$USER" /etc/hosts`

* run the script

`bash vshot`

The script will ask you about two things
1. The virtual-host name
2. The root directory

> In my case i've created a alias named vhost and here's the sample

`alias vhost="/home/devnet/mine/bash/vhost.sh"`

![Screenshot from 2021-09-26 18-19-38.png](/var/www/html/vhost/vhost.png)

##### Please let me know your thoughts, and PR is highly appreciated.
