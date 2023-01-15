provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAVAZX5MABOIIAF7OU"
  secret_key = "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"
}

resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical team leader"
  }
}