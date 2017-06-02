# AWS-CF-Templates

[![Build Status](https://travis-ci.org/kyhau/aws-cf-templates.svg?branch=master)](https://travis-ci.org/kyhau/aws-cf-templates)

Some AWS CloudFormation templates for personal use.

##### [UNLICENSE](LICENSE)

> The templates are provided "AS IS", without warranty of any kind, express or
implied, including but not limited to the warranties of merchantability,
fitness for a particular purpose and non infringement. In no event shall the
authors be liable for any claim, damages or other liability, whether in an
action of contract, tort or otherwise, arising from, out of or in connection
with the software or the use or other dealings in the software.

##### Table of Contents

- [Scripts to manage templates](#scripts-to-manage-templates)
- [Templates for creating EC2 and VPC aws resources](#templates-for-creating-ec2-and-vpc-aws-resources)
- [Templates for Lambda function management](#templates-for-lambda-function-management)
- [Templates for S3 management](#templates-for-s3-management)
- [Templates for S3 Static Website Hosting](#templates-for-s3-static-website-hosting)
- [Templates for Cognito](#templates-for-cognito)
- [Templates for databases](#templates-for-databases)
- [Templates for Polly](#templates-for-polly)
- [Templates for Inspector SNS](#templates-for-inspector-sns)
- [Templates for logging and reporting](#templates-for-logging-and-reporting)

##### Notes

- [Discussion](http://serverfault.com/questions/462522/why-doesnt-the-aws-cloud-formation-install-the-packages-that-i-specify)
  on [cloud-init](http://cloudinit.readthedocs.org/) vs. 
  [cfn-init](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-init.html).


## Scripts to manage templates

1. `deploy_to_s3.sh`
    - Deploy the latest templates to the specified S3 bucket.

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

1. `EC2-SaltMaster.template`
    - Create an EC2 instance from an AMI with the specified `EC2HostName`.
    - If `SaltVersion` is specified, Salt-Master and Salt-Minion will be installed with initial configurations.
    - Create an Elastic IP, attached to the EC2 instance.

1. `EC2-Basic-Linux.template`
    - Create an EC2 instance from an AMI with the specified `EC2HostName`.
    - If `SaltMasterHost` and `SaltVersion` are specified, Salt-Minion will be installed
      and the the salt-master host will be specified in `/etc/salt/minion`.    
    - Create an Elastic IP, attached to the EC2 instance.

1. `EC2-Basic-Windows.template`
    - Create an EC2 instance from an AMI with the specified `EC2HostName`.
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

1. `CloudFront-S3-StaticWebsite.template`
    - Create a CloudFront Distribution
    - Create S3 bucket with Static Website, Versioning and Logging enabled.
    - Create S3 bucket for logging.
    - Create Bucket Policy for PublicRead access.
    - Create a Managed Policy for managing and uploading files to the S3 bucket.
    - Attach the Managed Policy to the given Group.
    
    Prerequisites:

    1. Upload a server (ssl) certificate to IAM [using aws-cli](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html#upload-server-certificate).

       ```cmd
       aws iam upload-server-certificate ^
        --server-certificate-name example.com ^
        --certificate-body file://example.crt ^
        --private-key file://example.key ^
        --certificate-chain file://intermediate.crt ^
        --path /cloudfront/ ^
        --profile devops
       ```
    1. To retrieve the `ServerCertificateId` or other certificate details
   
       ```cmd
       aws iam list-server-certificates (--profile devops)
       ```

    1. Add Origin Access Identity for CloudFront to interact with S3 buckets (CloudFront > Origin Access Identity).
       Note that an Origin Access Identity cannot be created with CloudFormation ([Ref](https://stackoverflow.com/questions/20632828/aws-cloud-formation-script-to-create-s3-bucket-and-distribution)).
    1. Use the CloudFormation template.
    1. Add new Route53 record sets.


1. `S3-StaticWebsiteHosting.template`
    - Create S3 bucket with Static Website, Versioning and Logging enabled.
    - Create S3 bucket for logging.
    - Create Bucket Policy for PublicRead access.
    - Create a Managed Policy for managing and uploading files to the S3 bucket.
    - Attach the Managed Policy to the given Group.

## Templates for Cognito

1. `Cognito-Dev-GroupAndPolicy.template`
    - Create Group and Policy for Development team to access Cognito related resources.

## Templates for Databases

1. `RDS-PostgreSQL.template`
    - Create RDS PostgreSQL with PostGIS instance and a Read-Write managed policy attached.

1. `RDS-SecurityGroup.template`
    - Create RDS Security Group.

1. `DynamoDB-Table.template`
    - Create a DynamoDB Table.

1. `DynamoDB-Policy.template`
    - Create a managed policy for using and managing a DynamoDB table.

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

## Templates for logging and reporting 

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

