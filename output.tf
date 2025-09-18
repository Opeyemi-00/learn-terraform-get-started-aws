output "instance_hostname" {
	description = "dns"
	value = aws_instance.app_server.private-dns
}