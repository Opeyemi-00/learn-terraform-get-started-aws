output "ec2_instances_public_ips" {
	description = "output public ip"
	value = module.ec2_instances[*].public_ip
}

output "vpc_public_subnets" {
	description = "output public subnets"
	value = module.vpc.public_subnets
}

output "instance_hostnames" {
	description = "instance hostame"
	value = module.e2_instances.private_dns
}