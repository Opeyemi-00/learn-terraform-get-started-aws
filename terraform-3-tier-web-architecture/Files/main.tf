provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 6.0.0"

  name = var.vpc_name
  cidr = var.vpc_cidr_blocks

  azs             = var.vpc_azs
  private_subnets = slice(var.private_subnet_cidr_blocks, 0, 3)
  public_subnets  = slice(var.public_subnet_cidr_blocks, 0, 3)

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_nat_gateway   = var.enable_nat_gateway
  enable_vpn_gateway   = var.enable_vpn_gateway

}

module "aws_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = ">= 5.3.0"

  name        = "testsg"
  description = "services required"
  vpc_id        = module.vpc.vpc_id

  ingress_cidr_blocks      = var.ingress_cidr_blocks
  ingress_rules            = var.ingress_rules
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = ">= 6.0.0"

  ami           = var.ami_id
  instance_type = var.instance_type
  name          = var.instance_name
  count         = var.instance_count

  vpc_security_group_ids = [module.aws_security_group.security_group_id]
  subnet_id             = module.vpc.private_subnets[0]
}

resource "aws_db_subnet_group" "dbgroup" {
  subnet_ids = module.vpc.private_subnets
  tags = {
    name = "dbsgsg"
  }
}

resource "aws_db_instance" "testdb" {
  allocated_storage = 20
  db_name           = "exampledb"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t4g.micro"
  username          = var.db_username
  password          = var.db_password

  skip_final_snapshot  = true
  deletion_protection  = false
  db_subnet_group_name = aws_db_subnet_group.dbgroup.name
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = ">= 6.0.0"

  name    = "testalb"
  load_balancer_type = "application"

  vpc_id            = module.vpc.vpc_id
  subnets        = module.vpc.public_subnets
  security_groups = [module.aws_security_group.security_group_id]


  target_groups = [
    {
      name_prefix      = "app-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      target_id        = module.ec2_instances

      health_check = {
        enabled             = true
        interval            = 10
        path                = "/index.html"
        healthy_threshold   = 3
        unhealthy_threshold = 10
        timeout             = 5
      }
    }
  ]

  http_tcp_listeners = [{
    port               = 8080
    protocol           = "tcp"
    target_group_index = 0
  }]
}