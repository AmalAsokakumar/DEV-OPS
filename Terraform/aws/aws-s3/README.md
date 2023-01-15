# IAM User Creation 
```
provider "aws" {
  region     = "xxxxx"
  access_key = "xxxxxx"
  secret_key = "xxxxxxxxxxxxxx"
}

resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical team leader"
  }
}

```

- here instead of storing the credential in a hard coded manner. we can store this in `aws/config/credentials`
- or we can export credentials as env variable 
- with these steps we can completely avoid the aws provider block
```
$ export AWS_ACCESS_KEY_ID=xxxxxxx`
$ export AWS_SECRET_ACCESS_KEY=xxxxxxx
$ export AWS_REGION=us-east-1
```
```
resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical team leader"
  }
}
```

