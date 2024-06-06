#!/bin/bash

#apache2_installation

if [ ! -x /lib/systemd/system/apache2.service.d ]; then

	echo "INSTALLING LAMP"
echo    
echo    
	echo "INSTALLING apache2"
echo
echo
         apt install apache2 -y
echo
echo
        ufw app info "Apache Full"
echo
echo
        ufw allow in "Apache Full"
	systemctl enable apache2
	systemctl start apache2
echo
echo
	echo "SUCESSFULLY INSTALLED apache2";

else
echo
echo
        echo "ALREADY INSTALLED apache2"
echo
echo
fi

#apache2_installation

#php_installation
if [ ! -x /usr/bin/php ]; then
echo
echo
        echo "INSTALLING php"
echo
echo
         apt install php libapache2-mod-php php-mysql -y
	
	sed -i '2d' /etc/apache2/mods-enabled/dir.conf
	sed -i '2iDirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm' /etc/apache2/mods-enabled/dir.conf
	systemctl restart apache2
echo
echo 
	echo "SUCESSFULLY INSTALLED php";
else
echo
echo
        echo "ALREADY INSTALLED php"
echo
echo
fi



#php_installation

#mysql_installation

if [ ! -x /usr/bin/mysql ]; then 
echo
echo
	echo "INSTALLING mysql";
echo
echo
	 apt install mysql-server -y


echo
echo
mysql << EOF
DELETE FROM mysql.user WHERE User='';
FLUSH PRIVILEGES;
EOF
echo "SUCESSFULLY REMOVED ANONYMOUS USER";
echo
echo
mysql <<EOF
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
FLUSH PRIVILEGES;
EOF

echo "SUCESSFULLY REMOTE ROOT LOGINS DISABLED";
echo
echo
mysql << EOF
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;
EOF
echo "SUCESSFULLY test DATABASE REMOVED";
echo
echo
mysql << EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
EOF
echo "USER:root PASSWORD:password CREATED SUCESSFULLY";
echo
echo
	echo "SUCESSFULLY INSTALLED mysql";

else
echo
echo
	echo "ALREADY INSTALLED mysql"
echo
echo
fi

#mysql_installation
