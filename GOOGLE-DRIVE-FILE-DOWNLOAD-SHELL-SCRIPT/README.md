#  Shell script to download the gdrive files.

 * Download the script.

 * Change the script permission to 777

      ` ` ` sudo chmod 777 uptime.sh  ` ` `

 * Run the script with sudo.

      ` ` ` sudo ./uptime.sh ` ` ` 
      
  # Note:
  
   **Before running the script note the gdrive file size,FileID and make sure the file need to download is public.Need to provide while running the shell script.** 
  
   * **File size must noted because the downloading option will vary depends on the size atleast approximate values need to be noted.**
            
            Less than 100MB as small files & greater than 100MB as large files.Smaller files can be downloaded through larger file download option but not larger file can't download through samller file download option.
     
  * **Ddrive file ID  must to be noted.** 
         
         Example:  https://drive.google.com/file/d/1Lhz13RfSdT_nKCoDla141pu5JfwaM/view?usp=sharing  
         
         Here the Field id is from 1 to M i.e  1Lhz13RfSdT_nKCoDla141pu5JfwaM 
         
  * **Before the file to be downloaded it is needed to be share publicly.**

        Steps:

            * Select a file that is need to be downloaded and do right click.
            * Click Share. A dialog box will appear.
            * Click Advance in the right bottom corner.
            * Click on the Change.. under who has access.
            * Make it On- Public on the web.
            * Click Save button. 
            * Copy the link for sharing…like…https://drive.google.com/file/d/1Lhz13RfSdT_nKCoDla141pu5JfwaM/view?usp=sharing
            * Extrac FILEID part like from above 1Lhz13RfSdT_nKCoDla141pu5JfwaM
            
   **Finally provide file name need to save with respective extensions like yourfilanem.pdf, yourfilename.tar.gz etc**
   
   ## Demo Screenshot Image:
   
   ![alt text](https://github.com/shivdevops/Google-Drive-File-Upload-Shell-Script/blob/master/Google-Drive-Upload-Demo-Screenshot.png)
