# AWS-CF-Templates

Some AWS CloudFormation templates for personal use.

## Templates for creating some EC2 and VPC aws resources

1. `BaseInfrastructure-Linux-SaltMaster.template`
    - Create VPC (at Sydney)
    - Create public Subnet, RouteTable, Route, InternetGateway, NetworkAcl 
    - Create SecurityGroup for EC2 (Salt-master)
        - Special inbound rules
            - tcp 4505 0.0.0.0/0  salt-master publish-port
            - tcp 4506 0.0.0.0/0  salt-master ret-port
    - Create SecurityGroup for VPN

1. `BaseInfrastructure-LinuxEC2Instances.template`
    - Create VPC
    - Create public Subnet, RouteTable, Route, InternetGateway, NetworkAcl 
    - Create SecurityGroup for EC2 instances (Linux)
    - Create SecurityGroup for VPN

1. `BaseInfrastructure-WinEC2Instances.template`
    - Create VPC
    - Create public Subnet, RouteTable, Route, InternetGateway, NetworkAcl 
    - Create SecurityGroup for EC2 instances (Windows)
    - Create SecurityGroup for VPN

1. `EC2-Basic.template`
    - Create an EC2 instance from an AMI.
    - Create an Elastic IP, attached to the EC2 instance.

1. `EC2-OpenVPN.template`
    - Create an EC2 instance from an AMI of an openvpn instance.
    - Create an Elastic IP, attached to the EC2 instance.

## Templates for Lambda function management

1. `Lambda-CreateUpdatePolicies.template`
    - Create Managed Policy for creating and updating Lambda function.

## Templates for S3 management

1. `S3-WithVersioningAndLogging-ReadWriteDeletePolicy.template`
    - Create an IAM Group to be given Read-Write-Delete access to the S3 bucket.
    - Create a S3 bucket with versioning and logging enabled.
    - Create a S3 bucket for logging.
    - Create a Managed Policy giving Read-Write-Delete access to the S3 bucket.
    - Attach the Managed Policy to the given Group of `ReadWriteDeleteGroupName`.

1. `S3-WithVersioningAndLogging-ReadWriteDeletePolicy-ReadOnlyPolicy.template`
    - Create an IAM Group to be given Read-Write-Delete access to the S3 bucket.
    - Create an IAM Group to be given Read access to the S3 bucket.
    - Create a S3 bucket with versioning and logging enabled.
    - Create a S3 bucket for logging.
    - Create a Managed Policy giving Read-Write-Delete access to the S3 bucket.
    - Attach the Read-Write-Delete Managed Policy to the given Group of `ReadWriteDeleteGroupName`.
    - Create a Managed Policy giving Read-only access to the S3 bucket.
    - Attach the Read-only Managed Policy to the given Group of `ReadGroupName`.

1. `UserGroup.template`
    - Create a Group and add the specified users to the group.

## Templates for S3 Static Website Hosting

1. `S3-StaticWebsiteHosting.template`
    - Create S3 bucket with Static Website, Versioning and Logging enabled.
    - Create S3 bucket for logging.
    - Create Bucket Policy for PublicRead access.
    - Create a Managed Policy for managing and uploading files to the S3 bucket.
    - Attach the Managed Policy to the given Group.

## Templates for Inspector SNS

1. `Inspector-SNS.template`
   - Create a SNS topic with the specified name.
   - Create a SNS subscription with the specified email address for the Inspector finding subscription.
   - Create Topic Policies for the Inspector to publish message. Inspector of different region has different ARN.
     See [Setting Up an SNS Topic for Amazon Inspector Notifications](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_assessments.html#sns-topic).

## Templates for Logging and Reporting 

1. `CloudTrail.template`
    - Create CloudTrail resources and attach policies to the publish-user and devops-user

1. `CloudWatch-Alarms-for-CloudTrail-API-Activity.template`
    - AWS CloudTrail API Activity Alarm Template for CloudWatch Logs
    - Original [Source](https://s3-us-west-2.amazonaws.com/awscloudtrail/cloudwatch-alarms-for-cloudtrail-api-activity/CloudWatch_Alarms_for_CloudTrail_API_Activity.json) from Amazon.

## Templates for Polly 

1. `Polly-Dev-GroupAndPolicy.template`
    - Create a Group and Managed Policy to use Amazon Polly.
    - Create a Managed Policy allowing all actions except deleting Lexicon.
    - Attach the Managed Policy to the given Group of `PollyDevGroupName`.
