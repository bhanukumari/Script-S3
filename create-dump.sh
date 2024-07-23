#!/bin/bash
stamp=$(date +"%Y_%m_%d_%I_%M_%p")
#Year_Month_Day_Hour_Minute_AM/PM claculate currect date 
filename="$stamp-buildpiper-backup.sql"
#file name created by this type (2024_07_22_03_15_PM-buildpiper-backup.sql)
mysqldump -ubuildpiper -pbuildpiper@789 buildpiper > /root/backup_script/"$filename"
# output is redirected to a file in with the filename variable
/usr/local/bin/aws s3 cp /root/backup_script/"$filename" s3://buildpiper-nxtpe-backup/
# This command uploads the backup file to an Amazon S3 bucket named is buildpiper-nxtpe-backup
echo -e "\e[1;32m DB Backup Done $stamp \e[00m"
#  command is used to print text or variables to the terminal this line indicate the complited the database backup and code sets the text color is gree.
