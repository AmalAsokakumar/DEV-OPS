## S3 bucket

"mymodule" that creates an AWS S3 bucket. The module is located in a directory called "modules/mymodule" and has the following structure:

```
modules/mymodule
    main.tf
    variables.tf
    outputs.tf
```
The main.tf file contains the Terraform resources for creating the S3 bucket:

```
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
  acl    = "private"
}
```
The variables.tf file defines the variables that can be passed to the module:

```
variable "bucket_name" {
  type = string
}
```
The outputs.tf file defines the outputs that can be returned from the module:

```
output "bucket_name" {
  value = aws_s3_bucket.mybucket.bucket
}
```
In our main Terraform configuration file, we can then call the "mymodule" module and pass the required variables to it:

```
module "mymodule" {
  source = "./modules/mymodule"
  bucket_name = "my-example-bucket"
}
```

When we run terraform apply, Terraform will create the S3 bucket using the resources defined in the "mymodule" module and with the bucket_name passed as a variable.

We can also use the outputs returned from the module, for example:

```
output "s3_bucket_name" {
  value = module.mymodule.bucket_name
}
```
This is just a simple example, but it illustrates how Terraform modules can be used to organize and reuse Terraform code. In a real-world scenario, a module can contain many resources, and can have a more complex structure and dependencies



