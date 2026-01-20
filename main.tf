# provider "aws" {
#   region = var.region
# }

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "task-vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id

  public_subnet = {
    cidr = "10.0.1.0/24"
    az   = "us-east-1a"
  }

  private_subnets = [
    {
      cidr = "10.0.2.0/24"
      az   = "us-east-1a"
    },
    {
      cidr = "10.0.3.0/24"
      az   = "us-east-1b"
    }
  ]
}

module "public_rt" {
  source = "./modules/r"

  vpc_id           = module.vpc.vpc_id
  route_table_name = "public-rt"
  subnet_ids       = [module.subnet.public_subnet_id]
}

module "private_rt" {
  source = "./modules/r"

  vpc_id           = module.vpc.vpc_id
  route_table_name = "private-rt"
  subnet_ids       = module.subnet.private_subnet_ids
}
