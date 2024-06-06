# LAMP Installation, Apache2, Mysql and apache2 shell script fot ubuntu OS's.

**Installation script for LAMP current versions of apache2, mysql and php for linux ubuntu.** 

  * Download the script.
  
  * change the file permission with 777.
  
      ` ` ` sudo chmod 777 lamp.sh ` ` `

  * Run the script with sudo.  
     
      ` ` ` sudo ./lamp.sh ` ` `

    
  ## Prerequiste:
        
   * Ubuntu OS.

  ## Note:

   You can provide your own mysql root password by changing the default password "password" provided in this shell script lamp.sh-line no:104

   ` ` ` ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your-password'; ` ` ` 
 
