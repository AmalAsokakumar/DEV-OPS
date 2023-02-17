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
