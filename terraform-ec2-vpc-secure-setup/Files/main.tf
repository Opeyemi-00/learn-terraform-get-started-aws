provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.1.0"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs             = var.vpc_azs
  private_subnets = var.private_subnet_cidr_block
  public_subnets  = var.public_subnet_cidr_block

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_nat_gateway   = var.enable_nat_gateway
  enable_vpn_gateway   = var.enable_vpn_gateway

  tags = var.vpc_tags
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.1"

  name          = var.instance_name
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [module.aws_security_group.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]
}

module "aws_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "allowtls"
  description = "rule to allow tls"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_rules       = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "allow tls"
      cidr_blocks = "10.10.0.0/16"


    }



  ]
}