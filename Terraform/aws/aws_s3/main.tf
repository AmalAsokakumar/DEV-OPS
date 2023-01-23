resource "aws_s3_bucket" "finance" {
  bucket = "finance-20230109"
  tags = {
    Description = "Finance and Payroll"
  }
}
resource "aws_s3_bucket_object" "finance-2020" {
  content = "/root/finance/finance-2020.doc" # path to the document that we want to sent which will be read then upload using source, which conflict with conten.
  key     = aws_s3_bucket.finance.bucket
  bucket  = aws_s3_bucket.finance.id
}
data "aws_iam_group" "admin_group" {  # this block is used to get a group which was not created by this terraform state.
  group_name = "admin"
}
resource "aws_s3_bucket_policy" "finance-bucket-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect    = "Allow",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.finance.id}/*"
        Principal = ["${data.aws_iam_group.admin_group.arn}"]  # here we are using a group which was present in there before
      }
    ]
  })
}