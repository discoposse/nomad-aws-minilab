resource "aws_internet_gateway" "nomad-lab-igw" {
    vpc_id = aws_vpc.nomad-lab-vpc.id

    tags = {
    	Name = "nomad-lab"
    	Terraform = "true"
    	Turbonomic = "true"
  	}
}

resource "aws_route_table" "nomad-lab-public-crt" {
    vpc_id = aws_vpc.nomad-lab-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = aws_internet_gateway.nomad-lab-igw.id
    }
    
    tags = {
    	Name = "nomad-lab"
    	Terraform = "true"
    	Turbonomic = "true"
  	}
}

resource "aws_route_table_association" "nomad-public" {
    for_each = aws_subnet.nomad-lab-pub[count.index]

    subnet_id      = each.value.id
    route_table_id = aws_route_table.nomad-lab-public-crt.id
}

