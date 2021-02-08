output "private_ip_addr" {
    value = aws_instance.nomad-node[*].private_ip
}

output "public_ip_addr" {
    value = aws_instance.nomad-node[*].public_ip
}

output "consul_url" {
  	value = "http://${aws_instance.nomad-node[0].public_ip}:8500/ui"
}

output "nomad_url" {
  	value = "http://${aws_instance.nomad-node[0].public_ip}:4646/ui"
}

output "ec2_nodes" {
	value = aws_instance.nomad-node[*].public_dns
}

output "connection_info" {
	value = "ssh -i ${aws_instance.nomad-node[*].key_name} ${aws_instance.nomad-node[*].public_dns}"
}
