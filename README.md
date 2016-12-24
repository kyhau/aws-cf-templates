# AWS-CF-Templates

Some AWS CloudFormation templates for personal use.

## Templates for creating some aws resources

1. `BaseInfrastructure-Linux-SaltMaster.template`
    - Create VPC (at Sydney)
    - Create public Subnet, RouteTable, Route, InternetGateway, NetworkAcl 
    - Create SecurityGroup for EC2 (Salt-master)
        - Special inbound rules
            - tcp 4505 0.0.0.0/0  salt-master publish-port
            - tcp 4506 0.0.0.0/0  salt-master ret-port
    - Create SecurityGroup for VPN

2. `BaseInfrastructure-LinuxEC2Instances.template`
    - Create VPC
    - Create public Subnet, RouteTable, Route, InternetGateway, NetworkAcl 
    - Create SecurityGroup for EC2 instances (Linux)
    - Create SecurityGroup for VPN

2. `BaseInfrastructure-WinEC2Instances.template`
    - Create VPC
    - Create public Subnet, RouteTable, Route, InternetGateway, NetworkAcl 
    - Create SecurityGroup for EC2 instances (Windows)
    - Create SecurityGroup for VPN

3. `EC2-Basic.template`
    - Create an EC2 instance from an AMI.
    - Create an Elastic IP, attached to the EC2 instance.

4. `EC2-OpenVPN.template`
    - Create an EC2 instance from an AMI of an openvpn instance.
    - Create an Elastic IP, attached to the EC2 instance.

## Templates for Lambda function management

1. `Lambda-CreateUpdatePolicies.template`
    - Create Managed Policy for creating and updating Lambda function.

## Templates for S3 management

1. `S3-WithVersioningAndLogging-ReadWriteDeletePolicy.template`
    - Create a S3 bucket with versioning and logging enabled.
    - Create a S3 bucket for logging.
    - Create a Managed Policy giving Read-Write-Delete access to the S3 bucket.
    - Attach the Managed Policy to the given Group of `ReadWriteDeleteGroupName`.

2. `S3-WithVersioningAndLogging-ReadWriteDeletePolicy-ReadOnlyPolicy.template`
    - Create a S3 bucket with versioning and logging enabled.
    - Create a S3 bucket for logging.
    - Create a Managed Policy giving Read-Write-Delete access to the S3 bucket.
    - Attach the Read-Write-Delete Managed Policy to the given Group of `ReadWriteDeleteGroupName`.
    - Create a Managed Policy giving Read-only access to the S3 bucket.
    - Attach the Read-only Managed Policy to the given Group of `ReadGroupName`.

3. `UserGroup.template`
    - Create a Group and add the specified users to the group.


## Templates for S3 Static Website Hosting

1. `S3-StaticWebsiteHosting.template`
    - Create S3 bucket with Static Website, Versioning and Logging enabled.
    - Create S3 bucket for logging.
    - Create Bucket Policy for PublicRead access.
    - Create a Managed Policy for managing and uploading files to the S3 bucket.
    - Attach the Managed Policy to the given Group.

## Templates for Logging and Reporting 

1. `CloudTrail.template`
    - Create CloudTrail resources and attach policies to the publish-user and devops-user

2. `CloudWatch-Alarms-for-CloudTrail-API-Activity.template`
    - AWS CloudTrail API Activity Alarm Template for CloudWatch Logs
    - Original [Source](https://s3-us-west-2.amazonaws.com/awscloudtrail/cloudwatch-alarms-for-cloudtrail-api-activity/CloudWatch_Alarms_for_CloudTrail_API_Activity.json) from Amazon.
