variable "env_prefix" {
  type        = string
  description = "(optional) describe your variable"
}
variable "vpc_cidr_block" {
  type = string
}
variable "subnet_cidr_blocks" {
  type = list(string)
}
variable "avail_zone" {
  type = string
}
variable "my-ip" {
  type = string
}