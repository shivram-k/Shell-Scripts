#!/bin/bash

#ioncube_loader_installation

a=5.0
b=5.1
c=5.2
d=5.3
e=5.4
f=5.5
g=5.6
h=7.0
i=7.1
j=7.2
k=7.3
l=7.4


cd /home/

apt install wget -y

wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz

tar -xvf ioncube_loaders_lin_x86-64.tar.gz -C /usr/local

echo
echo

CURRENT=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")

echo "current php version of this system PHP-$CURRENT"



if [  $CURRENT = $a ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.0.so"  >> /etc/php/5.0/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.0.so" >>  /etc/php/5.0/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_5.0 sucessfully installed"

elif [  $CURRENT = $b  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.1.so"  >> /etc/php/5.1/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.1.so" >>  /etc/php/5.1/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_5.1 sucessfully installed"

elif [  $CURRENT = $c  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.2.so"  >> /etc/php/5.2/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.2.so"  >>  /etc/php/5.2/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_5.2 sucessfully installed"

elif [  $CURRENT = $d  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.3.so"  >> /etc/php/5.3/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.3.so"  >>  /etc/php/5.3/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_5.3 sucessfully installed"

elif [  $CURRENT = $e  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.4.so"  >> /etc/php/5.4/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.4.so"  >>  /etc/php/5.4/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_5.4 sucessfully installed"

elif [  $CURRENT = $f  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.5.so"  >> /etc/php/5.5/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.5.so"  >>  /etc/php/5.5/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_5.5 sucessfully installed"

elif [  $CURRENT = $g  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.6.so"  >> /etc/php/5.6/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_5.6.so"  >>  /etc/php/5.6/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_5.6 sucessfully installed"

elif [  $CURRENT = $h  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.0.so"  >> /etc/php/7.0/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.0.so"  >>  /etc/php/7.0/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_7.0 sucessfully installed"

elif [  $CURRENT = $i ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.1.so"  >> /etc/php/7.1/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.1.so"  >>  /etc/php/7.1/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_7.1 sucessfully installed"

elif [  $CURRENT = $j  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.2.so"  >> /etc/php/7.2/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.2.so"  >>  /etc/php/7.2/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_7.2 sucessfully installed"

elif [  $CURRENT = $k  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.3.so"  >> /etc/php/7.3/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.3.so"  >>  /etc/php/7.3/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_7.3 sucessfully installed"

elif [  $CURRENT = $l  ];
then
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.4.so"  >> /etc/php/7.4/apache2/php.ini
      echo " zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.4.so"  >>  /etc/php/7.4/cli/php.ini
      systemctl restart apache2
      echo "ioncube_loader_7.4 sucessfully installed"

else
   echo "None of the condition met"
fi

cd /home/
rm -rf ioncube_loaders_lin_x86-64.tar.gz

#ioncube_loader_installation
