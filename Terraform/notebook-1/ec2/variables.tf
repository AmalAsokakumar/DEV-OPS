variable "env_prefix" {
  type        = string
  description = "(optional) describe your variable"
}
variable "vpc_cidr_block" {
  type = string
}
variable "subnet_cidr_blocks" {
  type = list(object({
    cidr_block = string
    name = string
    az = string
  }))
}
variable "avail_zone" {
  type = string
}
variable "my-ip" {
  type = string
}
variable "instance_type" {
  type = string
}