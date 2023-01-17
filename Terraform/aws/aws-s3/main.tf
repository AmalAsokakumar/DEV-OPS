provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAVAZX5MABO"
  secret_key = "xwlU0YnqA6ciqOROu4"
}

resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical team leader"
  }
}