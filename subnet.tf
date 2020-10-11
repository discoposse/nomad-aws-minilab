resource "aws_subnet" "nomad-lab-pub" {
	count = 3
    vpc_id = aws_vpc.nomad-lab-vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.aws_region}${var.az_map[count.index]}"

    tags = {
    	Name = "nomad-lab"
    	Terraform = "true"
    	Turbonomic = "true"
  	}
}

