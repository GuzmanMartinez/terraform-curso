resource "aws_vpc" "vpc_europe" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "Europe"
    name = "prueba"
    env = "Dev"
  }
}

resource "aws_vpc" "vpc_oregon" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "EEUU"
    name = "prueba"
    env = "Dev"
  }
  provider = aws.oregon
}