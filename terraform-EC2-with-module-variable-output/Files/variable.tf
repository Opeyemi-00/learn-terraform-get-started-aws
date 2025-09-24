variable "aws_region" {
	description = "region"
	type = string
	default = "us-west-2"
}

variable "ami_id" {
	description = "amis"
	default = "ami-06a974f9b8a97ecf2"
}

variable "instance_type" {
	description = "Instance type"
	type = string
	default = "t3.micro"
}

variable "instance_name" {
	description = "instance name"
	type = string
	default = "1UniqueEC2"
}

variable "vpc_cidr_block" {
	description = "cidr block"
	type = string
	default = "10.0.0.0/16"
}

variable "private_subnet_cidr_block" {
	description = "private subnet block"
	type = list(string)
	default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
	]
}

variable "public_subnet_cidr_block" {
    description = "public subnet block"
    type = list(string)
    default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",

    ]
	
}

variable "enable_nat_gateway" {
	description = "nat gateway"
	type = bool
	default = true
}

variable "enable_vpn_gateway" {
	description = "nat gateway"
	type = bool
	default = false
}