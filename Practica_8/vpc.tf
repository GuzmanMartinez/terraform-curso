resource "aws_vpc" "vpc_europe" {
  cidr_block = var.europe_cidr
  tags = { 
    "Name" = "VPC_Europe-${local.sufix}"
  }

  #tags = var.tags
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_europe.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
  tags = { 
    "Name" = "public_subnet-${local.sufix}"
  }

  #tags = var.tags
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_europe.id
  cidr_block = var.subnets[1]
  tags = { 
    "Name" = "private_subnet-${local.sufix}"
  }

  depends_on = [
    aws_subnet.public_subnet
  ]

  #tags = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_europe.id

  tags = {
    Name = "igv vpc europe-${local.sufix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_europe.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public CRT-${local.sufix}"
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

  dynamic "ingress"{
    for_each = var.ingress_port_list
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = [var.sg_ingress_cidr]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.sg_ingress_cidr]
    #prefix_list_ids = [aws_vpc_endpoint.my_endpoint.prefix_list_id]
  }

  tags = {
    Name = "Public instance SG-${local.sufix}"
  }
}


module "mybucket" {
  source = "./modulos/s3"
  bucket_name = "nombreunico123456799"
}

output "s3_arn"{
  value = module.mybucket.s3_bucket_arn
}

module "terraform_state_backend" {
  source = "cloudposse/tfstate-backend/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version     = "0.38.1"
  namespace  = "exampleguzmi"
  stage      = "prod"
  name       = "terraform"
  attributes = ["state"]

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}
