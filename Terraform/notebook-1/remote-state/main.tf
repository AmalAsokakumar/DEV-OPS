provider "aws" {
    region = "us-east-1"
}

# create an s3 bucket
resource "aws_s3_bucket" "terraform-state"{
    bucket = "comrider-statefile-terraform"
    # to prevent accidental deletion.
    lifecycle {
        prevent_destroy = true
    }
    # enable version controlling to see full revision history of our state file. 
    versioning {
        enabled = true
    }
    # enable server-side encription.
    server_side_encryption_configuration {
        rule {
          apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
          }
        }
    }
}
resource "aws_dynamodb_table" "terraform_locks"{
    hash_key =  "LockID"
    name = "terraform-test-locks"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "LockID"
      type = "S"
    }
}

terraform {
  backend "s3"{
    bucket = "comrider-statefile-terraform"
    key = "../aws/terraform.tfstate" # path to the state file in side the bucket
    region = "us-east-1"
    # dynamo db 
    dynamodb_table = "terraform-test-locks"
    encrypt  = true
  }
}