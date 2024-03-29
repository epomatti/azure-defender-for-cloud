terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  workload   = "azurearc"
  public_key = file("~/.ssh/id_rsa.pub")
}

### Shared ###
module "vpc" {
  source     = "./modules/vpc"
  aws_region = var.aws_region
  workload   = local.workload
}

module "iam" {
  source   = "./modules/iam"
  workload = local.workload
}

resource "aws_key_pair" "default" {
  key_name   = "ssm-key"
  public_key = local.public_key
}

module "sg" {
  source   = "./modules/sg"
  workload = local.workload
  vpc_id   = module.vpc.vpc_id
}

### Instances ###
module "ubuntu_default" {
  count                   = var.create_linux_instance ? 1 : 0
  source                  = "./modules/ec2"
  workload                = local.workload
  iam_instance_profile_id = module.iam.instance_profile_id
  key_name                = aws_key_pair.default.key_name
  instance_type           = var.linux_instance_type
  ami                     = var.linux_ami
  security_group_id       = module.sg.sg_id
  subnet_id               = module.vpc.subnet_id
  user_data_file          = "ubuntu-default.sh"
  instance_label          = "ubuntu-default"
}

module "windows_default" {
  count                   = var.create_windows_instance ? 1 : 0
  source                  = "./modules/ec2"
  workload                = local.workload
  iam_instance_profile_id = module.iam.instance_profile_id
  key_name                = aws_key_pair.default.key_name
  instance_type           = var.windows_instance_type
  ami                     = var.windows_ami
  security_group_id       = module.sg.sg_id
  subnet_id               = module.vpc.subnet_id
  user_data_file          = "windows-default.txt"
  instance_label          = "windows-default"
}

### ECR ###
module "ecr" {
  source = "./modules/ecr"
}
