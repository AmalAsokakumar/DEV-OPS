resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content  = "We love pets"
}
terraform { #https://developer.hashicorp.com/terraform/language/settings/backends/s3
    backend "s3" {
        bucket = "name_of_the_bucket"
        key = "state/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table = "state-locking"
    }
}