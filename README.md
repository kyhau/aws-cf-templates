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
- [Templates for CloudFront Web Distribution with S3](templates/CloudFront-S3/README.md)
- [Templates for Cognito](templates/Cognito/README.md)
- [Templates for databases](templates/Database/README.md)
- [Templates for EC2 and VPC aws resources](templates/EC2-VPC/README.md)
- [Templates for Lambda function management](#templates-for-lambda-function-management)
- [Templates for API Gateway and Lambda function](#templates-for-api-gateway-and-lambda-function)
- [Templates for S3 management](#templates-for-s3-management)
- [Templates for S3 Static Website Hosting](#templates-for-s3-static-website-hosting)
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

## Templates for Lambda function management

1. `Lambda-CreateUpdatePolicies.template`
    - Create Managed Policy for creating and updating Lambda function.

## Templates for API Gateway and Lambda function

1. `ApiGateway-CloudWatch.template`
    - Enable API Gateway CloudWatch logging

1. `ApiGatewayInit-LambdaInit-andPolicies.template`
    - Create API Gateway with dummy content as a placeholder; the real content will be deployed by CI.
    - Create Lambda function with dummy content as a placeholder; the real function will be deployed by CI.
    - Create Managed Policy for updating and deploying Lambda function.
    - Create Managed Policy for updating and deploying Lambda function.

## Templates for S3 management

1. `S3-WithVersioningAndLogging-ReadWriteDeletePolicy-ReadOnlyPolicy.template`
    - Create a S3 bucket.
    - Enable server-side encryption if `ServerSideEncryptionAlgorithm` is set to `AES256` or `aws:kms`.
      Also need to specify `KMSMasterKeyID` is `aws:kms` is selected. 
    - Enable versioning if `EnableVersioning` set to `Enabled`.
    - Enable logging if `EnableLogging` set to `Enabled`. A S3 bucket for logging will also be created.
    - Optional - If `ReadWriteDeleteGroupName` is specified, create also an IAM Group and a Managed Policy giving
      Read-Write-Delete access to the S3 bucket.
    - Optional - If `ReadOnlyGroupName` is specified, create also an IAM Group and a Managed Policy giving
      Read-only access to the S3 bucket.

1. `UserGroup.template`
    - Create a Group and add the specified users to the group.

## Templates for S3 Static Website Hosting

1. `S3-StaticWebsiteHosting.template`
    - Create S3 bucket with Static Website
    - Enable Versioning (optional).
    - Enable Logging and create S3 bucket for logging (optional).
    - Create Bucket Policy for PublicRead access.
    - Create Managed Policy for managing and uploading files to the S3 bucket.
    - Attach the Managed Policy to the given Group.

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

