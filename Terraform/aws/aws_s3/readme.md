# simple storage service 
- it provides as an infinite scalable storage, high availability
- it's an object based storage 
- - can be used to store <br> plane file <br> videos <br> images <br> files <br> etc
- - it is not suitable to install an `os` or use it as `database`.
- data is stored in the form of bucket. The bucket act as a container/directory 
- we can create as many directory as we needed.
- everything with in a bucket is treated as an object.

## The considerations while creating a bucket
- account name must be unique - because when we create a bucket aws will also create a DSN name for it.
- with this dns name we can access this bucket from anywhere in the world.
- The name should be also `DNS Compliant Name`.
- - the should not be any uppercase or underscores
- - length should be `3 - 63` character long
- - it should not be end with a dash.
- - single file size should be 0 to 5 TB etc.

`a typical bucket name is`<br>
`https://<bucket_name>.<region>.amazonaws.com`
- datas are stored inside the bucket are in the form of key value pairs
- object data
- - key = object name
- - value = actual data
- Metadata
- - Owner 
- - Size
- - Last Modified

## access to the bucket are controlled by 
1. Bucket policy
- -  used to define permission on object level 
`read-objects.json`
```
{
    "Version" : "2012-10-17",
    "Statement" : [ 
        {
            "Actions": [
                "s3:GetObject"
            ],
            "Effects" : "Allow",
            "Resource" : "arn:aws"s3:::all-pet/*",
            "principal" : {
                "AWS":[
                    "arn:aws:iam::123456123457:user/Lucy"
                ]
            }
        }
    ]
}

```
buckets are use to allow or deny access to a certain resources.


2. Access control list
- - used to define



