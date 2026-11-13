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