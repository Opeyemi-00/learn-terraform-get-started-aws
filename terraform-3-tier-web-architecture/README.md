# Terraform 3-Tier AWS Architecture (VPC + EC2 + RDS + ALB)

This project sets up a 3-tier web architecture on AWS using Terraform.  
It includes networking, compute, database, and load balancing resources — all built from scratch using Terraform modules and AWS native services.

---

## Project Overview

The setup includes:

- A custom **VPC** with public and private subnets across multiple Availability Zones  
- **EC2 instances** in private subnets for the application layer  
- **RDS (MySQL)** as the database layer  
- An **Application Load Balancer (ALB)** in public subnets for traffic distribution  
- **Security Groups** to control access between layers

This design follows a typical 3-tier architecture pattern:  
**Load Balancer → Application Servers → Database.**

---

## Key Components

| Component | Description | Module/Resource |
|------------|--------------|----------------|
| VPC | Creates the networking layer | terraform-aws-modules/vpc/aws |
| EC2 | Deploys app servers | terraform-aws-modules/ec2-instance/aws |
| RDS | Creates the database | aws_db_instance + aws_db_subnet_group |
| Security Groups | Manages traffic rules | terraform-aws-modules/security-group/aws |
| ALB | Distributes traffic to app tier | terraform-aws-modules/alb/aws |

