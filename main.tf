provider "aws" {
	region = "eu-west-2"

}

module "vpc" {
	source = "terraform-aws-modules/vpc/aws"
	version = "5.19.0"

	name = "testtest.vpc"
	cidr = "10.0.0.0/16"

    azs = ["eu-west-a", "eu-west-b", eu-west-c]
    private_subnet = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnet = ["10.0.101.0/24"]

enable_dns_hostnames = true


} 

resource "aws_instance" "app_server" {
	 ami = "ami-046c2381f11878233"
	 instance_type = var.instance_type


   vpc_security_group_ids = [module.vpc.default_security_group_ids]
   subnet_id   = module.vpc.private_subnets[0]

	 tags {
      Name = var.instance_name

	 }



}