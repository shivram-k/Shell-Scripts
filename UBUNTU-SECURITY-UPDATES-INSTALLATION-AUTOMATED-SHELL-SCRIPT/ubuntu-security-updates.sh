#!/bin/bash
	
	#timestamp
	TIMESTAMP=$(date +"%d-%m-%Y")
	# defined the command to check kernel version
	KERNELVERSION=$(uname -srm)
	#destinaion directory to save the security patches log
	LOGDESTINATION=/home/security-updates-log/
        
        #creates the destination directory
        mkdir -p "$LOGDESTINATION"
        
	echo "The kernel version before security updates : $KERNELVERSION" >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log
echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

	 # No of security patches
	WC=$( apt-get -s dist-upgrade |grep "^Inst" |grep -i security | wc -l) 
	echo "No of Packages that security patches will apply : $WC" >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log
echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

	#security ptaches log with detail
	apt-get -s dist-upgrade |grep "^Inst" |grep -i security | cut -f 2- -d ' ' >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log
echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

	#installing security updates
	apt-get -s dist-upgrade | grep "^Inst" | grep -i securi | awk -F " " {'print $2'} | xargs apt-get install -y
	
	#checks whether security updates has succesfully completed
	if [ $? -eq 0 ]; then
    
	echo "Secutiry Updates sucessfully Done!" >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log
echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log   
   
	echo "The kernel version after security updates : $KERNELVERSION" >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log
echo >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

	# No of security patches
	echo "No of Packages that after security patches : $WC" >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log

else
	echo "Securtiy Upates have been FAILED! Kindly Check" >> "$LOGDESTINATION"security-updates-patches-$TIMESTAMP.log
    
fi
