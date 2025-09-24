provider "aws" {
	region = var.aws_region
}

module "vpc" {
	source = "terraform-aws-modules/vpc/aws"
	version = "6.2.0"
 
    name = "testvpc"
    cidr = var.vpc_cidr_block

    azs = ["us-west-2a", "us-west-2b", "us-west-2c"]
    private_subnets = slice(var.private_subnet_cidr_block, 0 , 2)
    public_subnets = slice(var.public_subnet_cidr_block, 0, 2)

    enable_dns_hostnames = true
    enable_nat_gateway = var.enable_nat_gateway
    enable_vpn_gateway = var.enable_vpn_gateway


}

resource "aws_instance" "app_server" {
	ami = var.ami_id
	instance_type = var.instance_type

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id = module.vpc.private_subnets[0]


	tags = {
	name = var.instance_name
	}
}