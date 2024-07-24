#!/bin/bash

# Date stamp for filename
stamp=$(date +"%Y_%m_%d_%I_%M_%p")
filename="$stamp-buildpiper-backup.sql"
maturity_filename="$stamp-maturity-backup.sql"
# Dump MySQL database
docker exec -i db mysqldump -uroot -ppassword buildpiper > /home/opstree/sql_backups/"$filename"
docker exec -i db mysqldump -uroot -ppassword maturity_dashboard >  /home/opstree/sql_backups/"$maturity_filename"
aws s3 cp "/home/ubuntu/sql_backups/$filename" s3://bp-23/
aws s3 cp "/home/ubuntu/sql_backups/$maturity_filename"  s3://bp-23/

# Delete files older than 5 days
find /home/ubuntu/sql_backups/ -type f -mtime +5 -delete

echo -e "\e[1;32m DB Backup Done $stamp \e[00m"
