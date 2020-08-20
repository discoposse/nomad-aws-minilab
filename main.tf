### Create Security Group
 
resource "aws_security_group" "instance" {
  name = "nomad-sg"
  vpc_id = var.aws_vpc_id
 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

### Create Nomad Nodes on EC2

resource "aws_instance" "nomad-node" {
    ami = var.nomad_node_ami_id
    instance_type = var.nomad_node_instance_size
    key_name = var.aws_key_name
    subnet_id = var.aws_subnet_id
    vpc_security_group_ids = [ "${aws_security_group.instance.id}" ]
    associate_public_ip_address = true
    user_data = file("install-nomad.sh")

    tags = {
        Terraform = "true"
        ProvisionedBy = "Project Terra"
        Turbonomic = "true"
    }
}

