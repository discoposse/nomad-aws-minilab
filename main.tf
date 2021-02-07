resource "aws_instance" "nomad-node" {
    count = var.nomad_node_count
    ami = var.nomad_node_ami_id
    instance_type = var.nomad_node_instance_size
    key_name = var.aws_key_name
    subnet_id = aws_subnet.nomad-lab-pub[count.index].id
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
    associate_public_ip_address = true
    #user_data = file("conf/install-nomad.sh")

    #user_data = templatefile("conf/install-nomad.sh",new_relic_license = ${var.new_relic_key})

    user_data = templatefile("conf/install-nomad.sh", { new_relic_license = var.new_relic_key })
    private_ip = "10.0.${count.index}.100"

    tags = {
        Terraform = "true"
        ProvisionedBy = "Project Terra"
        Turbonomic = "true"
        Name = "nomad-node-${count.index}"
    }
}

