
# MULTIPLE-PHP-VERSIONS-WITH-APACHE2-AUTOMATED-INSTALLATION-SCRIPT

**Shell script to enable multiple php versions in Ubuntu OS's & Server's with help of apache2 web server.**
 
 * Download the script.
 
 * Change the file permission with 777 
   
    ` ` ` sudo chmod 777 multiple_php_apache2.sh ` ` `

 * Run the script with sudo.  

     ` ` ` sudo ./multiple_php_apache2.sh` ` `

## Prerequistes:

* Ubuntu OS.
* Web Server apache2
   * Apache2-LAMP installation link: <https://github.com/shivdevops/LAMP-INSTALLATION-SHELL-SCRIPT> 
   
## Note:

**Before running the script,Need to replace the dummy values in the script with your own requirements.**

* Provide the php version to be configured by replacing the **"your-php-verson"** Line No:4 in the shell script.
    * Only provide the php versions with numbers alone eg: i.e **7.2 or 5.6**

* Provide your respective root folder path by replacing the **"your-root-directory-path"** Line No:36 in the shell script.(i.e /var/www/html or /opt/vhost)    

* Provide any name for apache2 virtual host conf by replacing **"your-conf-name"** Line No:39 in the shell script.

* Provide your respective domain name by replacing the **"your-domain-name"** Line No:42 in the shell script.

* Provide your generated SSL pem file with full path by replacing the **"your-ssl-pem-file-path"**  Line No:45 in the shell script.

* Provide you generated SSL key file with full path by replacing the **"your-ssl-key-file-path"** Line No:48 in the shell script.
