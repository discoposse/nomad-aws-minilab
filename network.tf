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

data "aws_subnet_ids" "nomad_subnets" {
    vpc_id = aws_vpc.nomad-lab-vpc.id
    filter {
        name   = "tag:Name"
        values = ["nomad-lab"]
    }

    depends_on = [
        aws_subnet.nomad-lab-pub,
        aws_route_table.nomad-lab-public-crt,
    ]
}

resource "aws_route_table_association" "subnet_association" {
    for_each = data.aws_subnet_ids.nomad_subnets.ids
    subnet_id = each.value
    route_table_id = aws_route_table.nomad-lab-public-crt.id

    lifecycle { 
        create_before_destroy = true 
    }

    depends_on = [
        aws_subnet.nomad-lab-pub,
        data.aws_subnet_ids.nomad_subnets,
        aws_route_table.nomad-lab-public-crt,
    ]
 }

