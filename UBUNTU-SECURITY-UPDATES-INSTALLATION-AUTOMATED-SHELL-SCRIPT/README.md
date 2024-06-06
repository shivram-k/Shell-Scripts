# An Automated shell script to update the security updates for ubuntu OS's.

**Script for security updates.**
* Download the script.
* Run the script with sudo.

  ` ` ` sudo ./ubuntu-security-updates.sh ` ` `

* change the file permission with 777 

   ` ` ` sudo chmod 777 ubuntu-security-updates.sh ` ` `
   
* You can change the destiation directory to store the Log Files by changing **"LOGDESTINATION"** variable in the 8 the line of the code.
   
    ` ` ` LOGDESTINATION=/home/security-updates-log/  ` ` `
 
**Add crontab to securtiy updates script to automate regular updates.**
