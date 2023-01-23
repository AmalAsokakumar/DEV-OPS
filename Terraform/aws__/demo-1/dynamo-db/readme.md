# Dynamo DB
1. it's a non sql database provided by `AWS`
2. highly scalable database, it can cope up with millions request form various device like mobile web and iot.
3. it's a fully managed database form AWS.
4. low data latency, high availability.
5. it stores data in the form of `key value` pairs. key act as a unique identifier, each entry into this database is called an item.
6. each item in this database is composed of one or more attributes. 
7. attributes are the keys that we defined for the table.
8. dynamo db uses a primary key to differentiate one item from another item in the database. 

# Create a DynamoDB Table in AWS

## Requirements
- AWS Account
- IAM User with appropriate permissions 

## Usage
1. Open the AWS Management Console in your web browser and navigate to the DynamoDB service.

2. Click on the "Create table" button to create a new table.

3. In the "Create DynamoDB table" form, enter a name for your table in the "Table name" field.

4. In the "Primary key" section, specify the primary key for the table. You can use either a "partition key" (also known as a "hash key") or a "partition key and sort key" (also known as a "hash and range key").

5. In the "Provisioned throughput" section, specify the read and write capacity units for your table. This determines the level of performance you need for your table.

6. Click on the "Create" button to create the table.

7. You can monitor the status of the table creation process by navigating to the "Tables" section of the DynamoDB console and checking the status of your table.

8. Once the table is created, you can add, modify or delete items from the table using the AWS Management Console, the AWS CLI, or one of the AWS SDKs.

9. To delete the table, select the table and choose action "Delete Table"

- Please ensure that you configure your IAM User with appropriate permissions to create, read and delete DynamoDB table and also that you should have an active AWS account with enough permissions to access the AWS Management Console.