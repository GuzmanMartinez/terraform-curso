resource "aws_vpc" "vpc_europe" {
  cidr_block = var.europe_cidr
  tags = {
    Name = "Europe"
    name = "prueba"
    env = "Dev"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_europe.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_europe.id
  cidr_block = var.private_subnet
}