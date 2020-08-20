output "private_ip_addr" {
    value = aws_instance.nomad-node[*].private_ip
}

output "public_ip_addr" {
    value = aws_instance.nomad-node[*].public_ip
}