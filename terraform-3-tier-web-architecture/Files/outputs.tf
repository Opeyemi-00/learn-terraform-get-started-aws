/*

output "ec2_instance_public_ips" {
  description = "output instance public ip"
  value       = module.ec2_instance[*].public_subnets
}

*/

output "vpc_public_subnets" {
  description = "output public subnets"
  value       = module.vpc.public_subnets
}