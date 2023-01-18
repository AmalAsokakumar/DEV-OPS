output "aws_ami_id" {
  value = data.aws_ami.latest-amazon-linux-image.id
}
output "ec2-public-ip"{
    value = aws_instance.my-app-ec2.public_ip
}
output "ami"{
    value = data.aws_ami.latest-amazon-linux-image.id
}
output "key-name"{
    value = aws_instance.my-app-ec2.key_name
}