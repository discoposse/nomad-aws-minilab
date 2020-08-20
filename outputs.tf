output "instance_ip_addr" {
    #count = 3
    value = aws_instance.server.private_ip
}