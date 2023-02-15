1. availability zone 
2. region 
3. aws global network
4. aws global infra , an overview 
5. pricing on aws, type of (aws calculator, aws pricing)
    - pay as you go
    - save when you reserve 
    - pay less by using more 
        - compute , resource and time 
        - storage , quantity 
        - outbound data transfer, free to upload data.
6. 





```
{
    "Version": "2012-10,17",
    "Id" : "S3-Account-Permissions",
    "Statement" : [  
        {
            "Sid" : "1",
            "Effect" : "Allow",
            "Principal" : {
                "AWS": ["arn:aws:iam:123456789012:root"]
            },
            "Action": [ 
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": ["arn:aws:s3:::bucket/*"]
        }
    ]
}
```

"Version": "2012-10-17": This line specifies the version of the IAM policy language that this policy is written in. In this case, it's version 2012-10-17.
"Id" : "S3-Account-Permissions": This is an optional field that can be used to give the policy a unique identifier. In this case, the policy is given the identifier "S3-Account-Permissions".
"Statement" : [: This field indicates the start of an array of statements that define the permissions granted by the policy. In this case, there is only one statement.
{: This marks the start of the first and only statement.
"Sid" : "1",: This field is a unique identifier for the statement. In this case, it's set to "1".
"Effect" : "Allow",: This field specifies whether the statement allows or denies access. In this case, it's set to "Allow", which means the specified actions are permitted.
"Principal" : {: This field specifies the AWS account that the policy applies to.
"AWS": ["arn:aws:iam:123456789012:root"]: This field specifies the AWS account ID that the policy applies to. In this case, it's the account with the ID 123456789012, with the root user.
},: Close the principal field
"Action": [: This field specifies the AWS service actions that are allowed or denied by the statement.
"s3:GetObject",: This action allows the specified principal to retrieve an object from the specified S3 bucket.
"s3:PutObject": This action allows the specified principal to add or replace an object in the specified S3 bucket.
],: Close the action field
"Resource": ["arn:aws:s3:::bucket/*"]: This field specifies the S3 bucket and objects that the statement applies to. In this case, it's the bucket identified by the ARN "arn:aws:s3:::bucket/", and all objects within the bucket (indicated by the "*" wildcard)
}: Close the statement
]: Close the statement field
}: Close the entire JSON policy
Please note that this is an example policy, it may not work as is and may need to be modified based on your specific use case.