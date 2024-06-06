#!/bin/bash

# provide the root directory path (eg:/var/www/html/ or /opt/vhost/)
ROOT_DIRECTORY_PATH="your-root-directory-path"

#provide apache2 virtual host conf name
NGINX_CONF_NAME="your-conf-name"

#provide your domain name i.e domain.com domain.in etc 
DOMAIN_NAME="your-domain-name"

#provide your ssl pem file path fully
SSL_PEM="your-ssl-pem-file-path"

#provide your ssl key file path fully
SSL_KEY="your-ssl-pem-file-path-key"

CURRENT_PHP=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")

mkdir -p $ROOT_DIRECTORY_PATH$DOMAIN_NAME

touch /etc/nginx/sites-available/$NGINX_CONF_NAME.conf

cat > /etc/nginx/sites-available/$NGINX_CONF_NAME.conf <<EOF
#http

server {
        
    listen 80;
        root $ROOT_DIRECTORY_PATH$DOMAIN_NAME;
        index index.php index.html index.htm;
        server_name $DOMAIN_NAME www.$DOMAIN_NAME;

    return 301 https://\$host\$request_uri;
        
    location ~ \.php$ {
           
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/$CURRENT_PHP-fpm.sock;
  }



    access_log /var/log/nginx/$DOMAIN_NAME.access.log;
    error_log /var/log/nginx/$DOMAIN_NAME.error.log;

}

#https 

server {
       
    listen 443 ssl;
        root $ROOT_DIRECTORY_PATH$DOMAIN_NAME;
        index  index.php index.html index.htm;
        server_name $DOMAIN_NAME www.$DOMAIN_NAME;

    location / {
        
        try_files \$uri \$uri/ =404;
}

    location ~ \.php$ {
        
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/$CURRENT_PHP-fpm.sock;
}

    location ~ /\.ht {

        deny all;
}

    ssl on;
    ssl_certificate $SSL_PEM;
    ssl_certificate_key $SSL_KEY;

    access_log /var/log/nginx/$DOMAIN_NAME.access.log;
    error_log /var/log/nginx/$DOMAIN_NAME.error.log;

}


EOF

  ln -s /etc/nginx/sites-available/$NGINX_CONF_NAME.conf /etc/nginx/sites-enabled
 
 systemctl reload nginx

echo  "Virtual Host Created sucessfully..! " >> /$ROOT_DIRECTORY_PATH$DOMAIN_NAME/index.html
echo
echo "Virtual Host Created Sucessfully"
echo
echo "virtual host conf name: $NGINX_CONF_NAME.conf"
echo
echo "virtual host conf path: /etc/nginx/sites-available/$APACHE2_CONF_NAME.conf"
echo
echo "Directory Root or Path and Directory Name for you domain: $ROOT_DIRECTORY_PATH$DOMAIN_NAME
"
echo
echo "check in your browser by:$DOMAIN_NAME or by:https://$DOMAIN_NAMEor by:http://$DOMAIN_NAME"
echo
