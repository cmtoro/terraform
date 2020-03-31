output "instance_public_ip_addr" {
  value = aws_instance.web.public_ip
}

output "instance_elastic_public_ip" {
  value = aws_eip.web_eip.public_ip
}