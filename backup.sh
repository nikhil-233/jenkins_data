#!/bin/bash

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
DATE=$(date +%y%m%d-%H%M)
BACKUP=db-$DATE.sql
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIA6HF4DONYRBATIWDL && \	
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "uploading your backup to s3" && \
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME/$BACKUP

