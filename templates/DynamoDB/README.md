# Templates for Databases

1. `DynamoDB-Table.template`
    - Create a DynamoDB Table with a primary key.
    - Create IAM policy for developer and deployment.
    - The table uses the On-Demand mode for Read/Write Capacities.
    - Create CloudWatch Alarms with SNS email notification for the DynamoDB table.

1. `DynamoDB-Policy.template`
    - Create a managed policy for using and managing a DynamoDB table.

1. `RDS-PostgreSQL.template`
    - Create RDS PostgreSQL with PostGIS instance and a Read-Write managed policy attached.

1. `RDS-SecurityGroup.template`
    - Create RDS Security Group.
