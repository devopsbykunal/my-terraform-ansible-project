output "dev_server_ips" {
  value = aws_instance.dev_server[*].public_ip
}

output "test_server_ips" {
  value = aws_instance.test_server[*].public_ip
}

output "nexus_server_ip" {
  value = aws_instance.nexus_server.public_ip
}
