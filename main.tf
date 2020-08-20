resource "aws_instance" "web" {
    ami = var.nomad_node_ami_id
    instance_type = var.nomad_node_instance_size
    key_name = var.aws_key_name

    tags = {
        Terraform = "true"
        ProvisionedBy = "Project Terra"
        Turbonomic = "true"
    }
}