resource "aws_vpc" "vpc_europe" {
  cidr_block = var.europe_cidr
  tags = { 
    "Name" = "VPC_Europe"
  }

  #tags = var.tags
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_europe.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
  tags = { 
    "Name" = "public_subnet"
  }

  #tags = var.tags
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_europe.id
  cidr_block = var.subnets[1]
  tags = { 
    "Name" = "private_subnet"
  }

  depends_on = [
    aws_subnet.public_subnet
  ]

  #tags = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_europe.id

  tags = {
    Name = "igv vpc europe"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_europe.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public CRT"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public instance SG"
  description = "Allow SSH inbound traffic and ALL egress trafic"
  vpc_id      = aws_vpc.vpc_europe.id

  ingress {
    description      = "SSH over internet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.sg_ingress_cidr]
    #prefix_list_ids = [aws_vpc_endpoint.my_endpoint.prefix_list_id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.sg_ingress_cidr]
    #prefix_list_ids = [aws_vpc_endpoint.my_endpoint.prefix_list_id]
  }

  tags = {
    Name = "Public instance SG"
  }
}