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

variable "vpc_cidr_blocks" {
  description = "vpc cidr blocks"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "private_subnet_cidr_blocks" {
  description = "private subnets"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24",
    "10.0.10.0/24",
  ]
}

variable "public_subnet_cidr_blocks" {
  description = "public subnets"
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
    "10.0.109.0/24",
    "10.0.110.0/24",
  ]
}

variable "enable_dns_hostnames" {
  description = "dns hostnames"
  type        = bool
  default     = true
}

variable "enable_nat_gateway" {
  description = "nat gateway"
  type        = bool
  default     = true
}

variable "enable_vpn_gateway" {
  description = "vpn gateway"
  type        = bool
  default     = false
}

variable "ingress_cidr_blocks" {
  description = "ingress cidr blocks"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "ingress_rules" {
  description = "ingress rules"
  type        = list(string)
  default     = ["https-443-tcp", "ssh-tcp", "http-80-tcp"]
}

variable "ingress_with_cidr_blocks" {
  description = "ingress with cidr blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    cidr_blocks = string
    })
  )
  default = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "service rules"
      cidr_blocks = "10.10.0.0/16"
    }

  ]
}

variable "ami_id" {
  description = "ami id"
  default     = "ami-03aa99ddf5498ceb9"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "instance name"
  type        = string
  default     = "testinstance"
}

variable "instance_count" {
  description = "instance count"
  type        = number
  default     = 2
}

variable "db_username" {
  description = "db username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "db password"
  type        = string
  sensitive   = true
}