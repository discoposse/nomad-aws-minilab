output "instance_ip_addr" {
    value = aws_instance.nomad-node[*].private_ip
}