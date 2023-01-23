# iam policy with terraform 
- here we have already created a user using the code 
```
resource "aws_iam_user" "admin-user"{
    name = "lucy"
    tags = {
        Description  = "Technical Team Leader"
    }
}

```
- we have a permission file

`Administrator Access Policy`
```
{
    "version" : "Allow",
    "Statement" : [
        "Effect" : "Allow",
        "Action" : "*",
        "Resource" : "*"
    ]
}
```
- here we need to add this `Administrator Access Policy` to the resource file.

###### which is possible through a number of ways 
1. using `heredoc syntax `
```
[command] << DELIMITER
Line1
Line2
Line3
DELIMITER
```
#### example 

```
resource "aws_iam_user" "admin-user"{
    name = "lucy"
    tags = {
        Description  = "Technical Team Leader"
    }
}
resource "aws_iam_policy" "adminUser"{
    name = "AdminUsers"
    policy =  << EOF
    {
        "version" : "Allow",
        "Statement" : [
            "Effect" : "Allow",
            "Action" : "*",
            "Resource" : "*"
        ]
    }
    EOF
}
resource 
```

###### error 
```
resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical Team Leader"
  }
}
resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effects  = "Allow",
        Resource = "*"
      }
    ]
  })
}

```
## Creating the iam user and attach the policy to the user.

- aws iam user 
- aws iam policy 
- attach iam policy to user

```
resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical Team Leader"
  }
}
resource "aws_iam_policy" "policy-admin-user" {
  name = "AdminUsers"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.policy-admin-user.arn
}
```

### - - one another way to use the policy 
`admin-policy.json `
```
    {
        "version" : "Allow",
        "Statement" : [
            "Effect" : "Allow",
            "Action" : "*",
            "Resource" : "*"
        ]
    }
```
- to load this file into the policy section we use the `file` function.

`main.tf`
```
resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical Team Leader"
  }
}
resource "aws_iam_policy" "policy-admin-user" {
  name = "AdminUsers"
  path = "/"
  policy = file("admin-policy.json")
resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.policy-admin-user.arn
}
```