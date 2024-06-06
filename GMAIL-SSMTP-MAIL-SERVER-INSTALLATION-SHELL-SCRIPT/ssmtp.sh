#!/bin/bash
#ssmtp_installation
echo "updating the system"
echo
echo
apt update -y
echo
echo
echo "installing mailutils"
echo
echo
apt-get install mailutils -y
echo
echo
echo "installing ssmtp"
echo
echo
apt-get install ssmtp -y
echo
echo
echo -n  "provide your email id:" 
read  mail
echo "AuthUser=$mail" >> /etc/ssmtp/ssmtp.conf

echo -n "Provide your email password:"
read  password;
echo "AuthPass=$password" >> /etc/ssmtp/ssmtp.conf

echo "mailhub=smtp.gmail.com:587" >> /etc/ssmtp/ssmtp.conf
echo "UseSTARTTLS=YES" >> /etc/ssmtp/ssmtp.conf
echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf
echo
echo
echo "ssmtp installation completed"
#ssmtp_installation
