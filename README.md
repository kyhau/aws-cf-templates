# AWS-CF-Templates

Some AWS CloudFormation templates for personal use.

##### Table of Contents

- [Templates for creating EC2 and VPC aws resources](#templates-for-creating-ec2-and-vpc-aws-resources)
- [Templates for Lambda function management](#templates-for-lambda-function-management)
- [Templates for S3 management](#templates-for-s3-management)
- [Templates for S3 Static Website Hosting](#templates-for-s3-static-website-hosting)
- [Templates for Polly](#templates-for-polly)
- [Templates for Inspector SNS](#templates-for-inspector-sns)
- [Templates for Logging and Reporting](#templates-for-logging-and-reporting)

## Templates for creating EC2 and VPC aws resources

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

1. `EC2-and-SecurityGroup-support-NFS-Rabbitmq.template`
    - Create an EC2 instance with an additional volume and Security Group supporting NFS and Rabbitmq ports.
    - Create an additional EBS and attached to the EC2 instance.
    - Create SecurityGroup for EC2 instances (Linux)
        - Special inbound rules
            - tcp 2049 NFS-port
            - tcp 5672 Rabbitmq-port 
    - Create an Elastic IP, attached to the EC2 instance.


## Templates for Lambda function management

1. `Lambda-CreateUpdatePolicies.template`
    - Create Managed Policy for creating and updating Lambda function.

## Templates for S3 management

1. `BN-S3-WithVersioningAndLogging-ReadWriteDeletePolicy-ReadOnlyPolicy.template`
    - Create a S3 bucket with logging enabled.
    - Create a S3 bucket for logging.
    - Enable versioning if `EnableVersioning` set to `Enabled`.
    - Optional - If `ReadWriteDeleteGroupName` is specified, create also an IAM Group and a Managed Policy giving
      Read-Write-Delete access to the S3 bucket.
    - Optional - If `ReadOnlyGroupName` is specified, create also an IAM Group and a Managed Policy giving
      Read-only access to the S3 bucket.

1. `UserGroup.template`
    - Create a Group and add the specified users to the group.

## Templates for S3 Static Website Hosting

1. `S3-StaticWebsiteHosting.template`
    - Create S3 bucket with Static Website, Versioning and Logging enabled.
    - Create S3 bucket for logging.
    - Create Bucket Policy for PublicRead access.
    - Create a Managed Policy for managing and uploading files to the S3 bucket.
    - Attach the Managed Policy to the given Group.

## Templates for RDS

1. `RDS-PostgreSQL.template`
    - Create RDS PostgreSQL with PostGIS instance and a Read-Write managed policy attached.

1. `RDS-SecurityGroup.template`
    - Create RDS Security Group.

## Templates for Polly 

1. `Polly-Dev-GroupAndPolicy.template`
    - Create a Group and Managed Policy to use Amazon Polly.
    - Create a Managed Policy allowing all actions except deleting Lexicon.
    - Attach the Managed Policy to the given Group of `PollyDevGroupName`.

## Templates for Inspector SNS

1. `Inspector-SNS.template`
   - Create a SNS topic with the specified name.
   - Create a SNS subscription with the specified email address for the Inspector finding subscription.
   - Create Topic Policies for the Inspector to publish message. Inspector of different region has different ARN.
     See [Setting Up an SNS Topic for Amazon Inspector Notifications](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_assessments.html#sns-topic).

## Templates for Logging and Reporting 

1. `CloudTrail-S3-SNS.template`
    - Create an AWS CloudTrail trail capturing AWS API calls made by your AWS account.
    - Create a S3 bucket and a Bucket Policy
    - Create a SNS Topic and a Topic Policy
    - This template is useful for resource reporting (e.g. EC2 uptimes, etc)
    - See [User Guide: aws-resource-cloudtrail-trail](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-cloudtrail-trail.html)
    - See [User Guide: create-s3-bucket-policy-for-cloudtrail.html#troubleshooting](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html#troubleshooting)

1. `CloudWatch-Alarms-for-CloudTrail-API-Activity.template`
    - AWS CloudTrail API Activity Alarm Template for CloudWatch Logs
    - Define metric filters that monitor creation and deletion of, or updates to, security groups, network ACLs, internet gateways, Amazon EC2 instances, and IAM policies. For each filter, the template describes a corresponding alarm that enables to you to receive email notifications when a call to one of the APIs being monitored by the filter is made.
    - By default, most of the filters in the template trigger an alarm when one monitored event occurs within a five-minute period. You can modify these alarm thresholds for your own requirements. For example, you could monitor for 3 events in a 10-minute period. 
    - Create also the LogGroup
    - Modified from Original [Source](https://s3-us-west-2.amazonaws.com/awscloudtrail/cloudwatch-alarms-for-cloudtrail-api-activity/CloudWatch_Alarms_for_CloudTrail_API_Activity.json) from Amazon.

