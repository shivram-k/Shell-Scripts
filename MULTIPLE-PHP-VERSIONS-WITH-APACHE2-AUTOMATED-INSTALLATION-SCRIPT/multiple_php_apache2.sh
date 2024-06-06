#!/bin/bash

	#provide your needed php version i.e 7.2 or 5.6
	PHP_VERSION="your-php-verson"


	MODULE=$(dpkg -l | grep libapache2-mod-fcgid | awk '{ print$2}')

if [  "$MODULE" != "libapache2-mod-fcgid"  ]; then

	echo " Installing libapache2-mod-fcgid"
	apt install libapache2-mod-fcgid

fi


	CHECk_PHP=$(dpkg -l | grep ' php[0-9]\.[0-9] ' | grep -w $PHP_VERSION | awk '{ print$2}')

  if [  "$PHP_VERSION" != "$CHECk_PHP"  ]; then

	echo " Installing php"

	yes '' | add-apt-repository ppa:ondrej/php &&  apt update

	apt install $PHP_VERSION $PHP_VERSION-fpm  $PHP_VERSION-mysql $PHP_VERSION-curl -y

	a2enmod actions alias proxy_fcgi fcgid

	systemctl restart apache2

else
        echo " Already Installed"

fi
# provide the root directory path (eg:/var/www/html/ or /opt/vhost/)
ROOT_DIRECTORY_PATH="your root directory path"

#provide apache2 virtual host conf name
APACHE2_CONF_NAME="your-name"

#provide your domain name i.e domain.com domain.in etc 
DOMAIN_NAME="your=domain"

#provide your ssl pem file path fully
SSL_PEM="your-ssl-pem-file-path"

#provide your ssl key file path fully
SSL_KEY="your-ssl-pem-file-path"


	echo "Creating Apache2 Virtual Host"

	mkdir -p $ROOT_DIRECTORY_PATH$DOMAIN_NAME

	touch /etc/apache2/sites-available/$APACHE2_CONF_NAME.conf

cat > /etc/apache2/sites-available/$APACHE2_CONF_NAME.conf <<EOF

<VirtualHost *:80>

    	ServerAdmin webmaster@localhost
        ServerName $DOMAIN_NAME
        ServerAlias www.$DOMAIN_NAME

        Redirect  / https://www.$DOMAIN_NAME

    	DocumentRoot $ROOT_DIRECTORY_PATH$DOMAIN_NAME

    	<Directory $ROOT_DIRECTORY_PATH$DOMAIN_NAME/>
               
		Options Indexes FollowSymLinks
                AllowOverride All
                Require all granted
        
	</Directory>

    	ErrorLog \${APACHE_LOG_DIR}/error.log
     	CustomLog \${APACHE_LOG_DIR}/access.log combined

</VirtualHost>


<IfModule mod_ssl.c>

    <VirtualHost _default_:443>

    	ServerAdmin webmaster@localhost
        ServerName $DOMAIN_NAME
    	ServerAlias www.$DOMAIN_NAME

    	DocumentRoot $ROOT_DIRECTORY_PATH$DOMAIN_NAME

	<Directory $ROOT_DIRECTORY_PATH$DOMAIN_NAME/>
  
		 Options Indexes FollowSymLinks
   		 AllowOverride All
   		 Require all granted

	</Directory>

	ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
        
	SSLEngine on
        SSLCertificateFile     $SSL_PEM
        SSLCertificateKeyFile  $SSL_KEY


	<FilesMatch "\.(cgi|shtml|phtml|php)$">
	
		SSLOptions +StdEnvVars
	
	</FilesMatch>


	<FilesMatch \.php> # Apache 2.4.10+ can proxy to unix socket

      		SetHandler "proxy:unix:/var/run/php/$PHP_VERSION-fpm.sock|fcgi://localhost/"

	 </FilesMatch>

        
	<Directory /usr/lib/cgi-bin>

        	      SSLOptions +StdEnvVars

        </Directory>

</VirtualHost>

</IfModule>
EOF


	a2ensite $APACHE2_CONF_NAME.conf -q
  	a2enmod ssl -q
	a2enmod rewrite -q
  	systemctl reload apache2


	touch $ROOT_DIRECTORY_PATH$DOMAIN_NAME/info.php

cat > $ROOT_DIRECTORY_PATH$DOMAIN_NAME/info.php <<EOF

<?php
phpinfo();
?>

EOF


	echo  "Virtual Host Created sucessfully..! " >> /$ROOT_DIRECTORY_PATH$DOMAIN_NAME/index.html
echo
	echo "Virtual Host Created Sucessfully"
echo
	echo "virtual host conf name: $APACHE2_CONF_NAME.conf"
echo
	echo "virtual host conf path: /etc/apache2/sites-available/$APACHE2_CONF_NAME.conf"
echo
	echo "Directory Root or Path and Directory Name for you domain: $ROOT_DIRECTORY_PATH$DOMAIN_NAME"
echo
	echo "check in your browser by:$DOMAIN_NAME or by:https://$DOMAIN_NAME or by:http://$DOMAIN_NAME"
echo
	echo "Check php version in your browser by $DOMAIN_NAME/info.php or by:https://$DOMAIN_NAME/info.php "
echo
