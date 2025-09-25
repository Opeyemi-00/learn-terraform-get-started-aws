variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "vpc name"
  type        = string
  default     = "testvpc"
}

variable "vpc_cidr_block" {
  description = "cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "private_subnet_cidr_block" {
  description = "Private subnet block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidr_block" {
  description = "Public subnet block"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "enable_dns_hostnames" {
  description = "dns hostnames"
  type        = bool
  default     = true
}

variable "enable_nat_gateway" {
  description = "dns hostnames"
  type        = bool
  default     = true
}

variable "enable_vpn_gateway" {
  description = "dns hostnames"
  type        = bool
  default     = false
}

variable "vpc_tags" {
  description = "vpc tags"
  type        = map(string)
  default = {
    terraform   = "true"
    environment = "dev"

  }
}

variable "instance_name" {
  description = "instance name"
  type        = string
  default     = "example3"
}

variable "ami_id" {
  description = "ami id"
  default     = "ami-06a974f9b8a97ecf2"
}

variable "instance_type" {
  description = "instance name"
  type        = string
  default     = "t3.micro"
}

variable "instance_count" {
  description = "instance count"
  type        = number
  default     = 2
}

