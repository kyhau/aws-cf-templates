# AWS-CF-Templates

Some AWS CloudFormation Templates for personal use.

## Templates for creating some aws resources

1. `BaseInfrastructureForLinuxEC2Instances.template`
    - Create VPC, InternetGateway, NetworkAcl, Route, RouteTable, Subnet, SecurityGroups for EC2 instances (Linux), SecurityGroup for VPN

2. `BaseInfrastructureForWinEC2Instances.template`
    - Create VPC, InternetGateway, NetworkAcl, Route, RouteTable, Subnet, SecurityGroups for EC2 instances (Windows), SecurityGroup for VPN

3. `EC2-OpenVPN.template`
    - Create an EC2 instance from an AMI of an openvpn instance.
    - Create an Elastic IP, attached to the EC2 instance.

4. `EC2-Basic.template`
    - Create an EC2 instance from an AMI.
    - Create an Elastic IP, attached to the EC2 instance.

## Templates for S3 Static Website Hosting

1. `S3-StaticWebsiteHosting.template`
    - Create S3 bucket with Static Website, Versioning and Logging enabled
    - Create S3 bucket for logging
    - Create Bucket Policy for PublicRead access
    - Create a Managed Policy for managing and uploading files to the S3 bucket
    - Attach the Managed Policy to the given Group

## Templates for S3 management

1. `UserGroups_S3ReadWriteDelete.template`
    - Create Groups to access resources.

2. `UserGroups_S3Restricted.template`
    - Create Groups to access resources.

3. `S3-Buckets-Default.template`
    - Create default S3 buckets (policies not included)

4. `S3-Bucket.template`
    - Create a group and managed policy for accessing bucket and ensure the right list of the user are added to the group.

5. `S3-Bucket-Restricted.template`
    - Create groups and managed policies for accessing bucket and ensure the right list of the user are added to the group.

## Templates for Logging and Reporting 

1. `CloudTrail.template`
    - Create CloudTrail resources and attach policies to the publish-user and devops-user

2. `CloudWatch-Alarms-for-CloudTrail-API-Activity.template`
    - AWS CloudTrail API Activity Alarm Template for CloudWatch Logs
    - Original [Source](https://s3-us-west-2.amazonaws.com/awscloudtrail/cloudwatch-alarms-for-cloudtrail-api-activity/CloudWatch_Alarms_for_CloudTrail_API_Activity.json) from Amazon.
