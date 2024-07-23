#!/bin/bash
BUCKET_NAME="bp-bucket-sid"
# Set this to the folder path like usr prefix like this("folder/subfolder/")
PREFIX=""
# List the contents of the bucket
echo "Listing contents of bucket: $BUCKET_NAME"

# If you have a prefix, include it in the command
if [ -n "$PREFIX" ]; then
  aws s3 ls s3://$BUCKET_NAME/$PREFIX --recursive
else
 # If PREFIX is not set, list all contents in the bucket
  aws s3 ls s3://$BUCKET_NAME --recursive
fi
