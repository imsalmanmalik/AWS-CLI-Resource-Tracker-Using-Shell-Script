# AWS Resource Tracker

AWS Resource Tracker is a project that automates the tracking of AWS resources using AWS CLI and Shell Scripting.

## Project Description

The project aims to simplify the monitoring and tracking of AWS resources by leveraging the AWS Command Line Interface (CLI) and a shell script. By executing the script, you can gather information about S3 buckets, EC2 instances, Lambda functions, and IAM users, and store the results in a file for further analysis.

## Project Flow

1. **EC2 Instance Creation**: Create an EC2 Ubuntu instance on AWS, specifically a t3.micro instance.
2. **Instance Key Permissions**: Change the permissions of the instance key using `chmod 600`.
3. **SSH Login**: Use SSH to log in to the EC2 instance.
4. **AWS CLI Installation**: Install AWS CLI inside the EC2 instance using the bash shell.
5. **Shell Script**: Write a shell script named `aws_resource_tracker.sh` to automate the resource tracking process.
6. **Resource Usage Information**: The shell script retrieves and captures information about AWS resources, including S3 buckets, EC2 instances, Lambda functions, and IAM users.
7. **Output File**: The collected resource usage information is appended to a file named `resourceTracker`.
8. **Cron Job Integration**: Integrate a cron job that runs the `aws_resource_tracker.sh` script every hour to continuously track AWS resource usage.

## Usage

To use the `aws_resource_tracker.sh` script, follow these steps:

1. SSH into your EC2 instance.
2. Create the script or upload it to the instance.
3. Make the script executable: `chmod +x aws_resource_tracker.sh`.
4. Run the script: `./aws_resource_tracker.sh`.
5. The resource usage information will be written to the `resourceTracker` file.

### Using `jq` JSON Parser

The `jq` command-line tool is used in the shell script to parse and manipulate JSON data. In the script, the following line demonstrates the usage of `jq` to extract EC2 instance IDs from the JSON response:

```bash
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> "$OUTPUT_FILE"
```
This line retrieves the instance IDs from the JSON response of the describe-instances command and appends them to the resourceTracker file.

Make sure to install jq on your EC2 instance before running the script. You can install it using package managers like apt-get:

```bash
sudo apt-get install jq
```

## Cron Job

To automate the resource tracking process, you can set up a cron job to execute the aws_resource_tracker.sh script at specified intervals. Here's an example of how to set up a cron job to run the script every hour:

Open the cron table for editing by running the command:

```bash
crontab -e
```
Add the following line to the file:
```bash
0 * * * * /path/to/aws_resource_tracker.sh
```
Replace /path/to/aws_resource_tracker.sh with the actual path to your aws_resource_tracker.sh script. In this project the path was 'home/ubuntu'

Save the file and exit the editor.

The cron job will now execute the script every hour, collecting and appending resource usage information to the resourceTracker file automatically.

## Prerequisites
Before using this project, ensure the following:

1. You have an AWS account with the necessary permissions to access and retrieve resource information.
2. You have an EC2 instance running Ubuntu, and you can SSH into it.
3. AWS CLI is installed on your EC2 instance.
4. jq is installed on your EC2 instance.
5. The instance key's permissions are set correctly (chmod 600).
