module "mymodule-vpc" {
  source              = "../modules/modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  public_subnet_az    = "us-east-2a"
  private_subnet_cidr = "10.0.2.0/24"
  private_subnet_az   = "us-east-2b"
}