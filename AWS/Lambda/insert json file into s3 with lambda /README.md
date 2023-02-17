# This lambda function is used to push a json script to s3 bucket

## 1. create an `IAM` rule. 
    - S3 put permission  (create using s3 inline policy)
``` 
               {
                    "Version": "2012-10-17",
                    "Statement": [
                        {
                            "Sid": "VisualEditor0",
                            "Effect": "Allow",
                            "Action": "s3:PutObject",
                            "Resource": "*"
                        }
                    ]
                }
```

`Policies ->  Policy Name` -> `S3PutPolicy`

#### Attache `AWSLambdaBasicExecutionRole` and `S3PutPolicy` to the role that we are creating.
- Role details
    - role name -> S3PutObjectRole

## 2. Creating an `S3` bucket to upload the files. 
- name the bucket -> follow default steps

## 3. Create lambda function

```
Lambda -> Functions -> Create function
    - Function Name -> PutObjectS3
    - Runtime -> python3.9
    - Architecture -> x86_64
    - permission -> use an existing role -> S3PutPolicy

Create. 
```
### Now we actually need to code our lambda function.

```
import json
import boto3  # needed to interact with s3 from python

s3 = boto3.client('s3')

def lambda_handler(event, context):
    bucket = 'awssimplifedtransationtestbucket'
    
    transactionToUpload = {}
    transactionToUpload['transactionId'] = '12345'
    transactionToUpload['type'] = 'PURCHASE'
    transactionToUpload['amount'] = 20
    transactionToUpload['customerId'] = 'CID-1111'
    
    fileName = 'CID-1111' + '.json'
    uploadByteStream = bytes(json.dumps(transactionToUpload).encode('UTF-8'))
    
    s3.put_object(Bucket=bucket, Key=fileName, Body=uploadByteStream)
    print('Put Complete')     
```

`Lambda function log`

```
Test Event Name
test

Response
null

Function Logs
START RequestId: f8c28e63-079e-467b-809b-6aa4dd33e7a5 Version: $LATEST
Put Complete
END RequestId: f8c28e63-079e-467b-809b-6aa4dd33e7a5
REPORT RequestId: f8c28e63-079e-467b-809b-6aa4dd33e7a5	Duration: 29.22 ms	Billed Duration: 30 ms	Memory Size: 128 MB	Max Memory Used: 70 MB

Request ID
f8c28e63-079e-467b-809b-6aa4dd33e7a5

```

