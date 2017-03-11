#!/bin/bash +x
set -e

if [ -z ${AWS_BUCKET} ]; then
  echo "Error: AWS_BUCKET is unset"
  exit 1
fi

if [ -z ${AWS_ACCESS_KEY_ID} ]; then
  echo "Error: AWS_ACCESS_KEY_ID is unset"
  exit 1
fi

if [ -z ${AWS_SECRET_ACCESS_KEY} ]; then
  echo "Error: AWS_SECRET_ACCESS_KEY is unset"
  exit 1
fi

echo "##########################################################################"
echo "Copying templates to S3 ..."

aws s3 sync templates/. s3://${AWS_BUCKET}
