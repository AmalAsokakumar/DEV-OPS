output "aws_ami_id" {
  value = data.aws_ami.latest-amazon-linux-image
}
output "ami" {
  value = data.aws_ami.latest-amazon-linux-image.id
}
output "ec2-public-subnet" {
  value = aws_instance.my-app-ec2.public_ip
}
output "key-name" {
  value = aws_instance.my-app-ec2.key_name
}
output "key-name" {
  value = aws_instance.instance-on-private-subnet.key_name
}
output "ec2-private-subnet" {
    value = aws_instance.instance-on-private-subnet.public_ip
}
output "key-name" {
  value = aws_instance.instance-on-private-subnet.key_name
}

