output "vpc_id"{
    value = aws_vpc.my-module-vpc.id
}
output "public_subnet_ids"{
    value = [aws_subnet.public-module-subnet.id]
}
output "private_subnet_ids"{
    value = [aws_subnet.private-module-subnet.id]
}
output "nat_gateway_id"{
    value = aws_nat_gateway.nat.id
}