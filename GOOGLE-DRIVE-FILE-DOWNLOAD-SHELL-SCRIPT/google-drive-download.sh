#!/bin/bash

#reads the file size to choose the method
echo -n "Provide the file size for downloading options in digit alone(<100mb-small,>100mb-large):"
read FILESIZE;

#reads the file id for downloading
echo -n "Provide the fileId of gdrive link (eg:1mAbq7iRAB7wYzGFNQnkRwiwUapI5A0tQ):"
read FILEID;

#reads the  output filename to save
echo -n "Provide  File name need to s with extension(.pdf,.tar.gz,.zip) :"
read FILENAME;

if [[ $FILESIZE  -lt 100 ]]; then

        #filesize less than 100mb then it follows this method
        wget --no-check-certificate "https://docs.google.com/uc?export=download&id=${FILEID}" -O $FILENAME

else

        #filesize greather than 100mb then it follows this method       
        wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies 
	/tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=${FILEID}" -O- |
	sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${FILEID}" -O $FILENAME && rm -rf /tmp/cookies.txt

fi
