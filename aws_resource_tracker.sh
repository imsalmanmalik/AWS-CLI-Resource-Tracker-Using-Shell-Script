#!/bin/bash
# Author: Salman
# Date: 27th-June
# Version: v1
#
# This script will report the AWS resource usage
##########

set -x

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# Define output file
OUTPUT_FILE="/home/ubuntu/resourceTracker.txt"

# List s3 buckets
echo "Print list of s3 buckets" >> "$OUTPUT_FILE"
aws s3 ls >> "$OUTPUT_FILE"

# List EC2 instances
echo "Print list of EC2 instances" >> "$OUTPUT_FILE"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> "$OUTPUT_FILE"


# List Lambda
echo "Print list of Lambda functions" >> "$OUTPUT_FILE"
aws lambda list-functions >> "$OUTPUT_FILE"

# List IAM Users
echo "Print list of IAM Users" >> "$OUTPUT_FILE"
aws iam list-users >> "$OUTPUT_FILE"# List IAM Users
echo "Print list of IAM Users" >> "$OUTPUT_FILE"
aws iam list-users >> "$OUTPUT_FILE"
