resource "aws_vpc" "vpc_europe" {
  cidr_block = var.europe_cidr
  tags = {
    Name = "Europe"
    name = "prueba"
    env = "Dev"
  }
}

resource "aws_vpc" "vpc_oregon" {
  cidr_block = var.oregon_cidr
  tags = {
    Name = "EEUU"
    name = "prueba"
    env = "Dev"
  }
  provider = aws.oregon
}
/*
variable "europe_cidr" {
  //default = "10.10.0.0/16"
}

variable "oregon_cidr" {
  //default = "10.20.0.0/16"
}
*/


/*DEFINIR VARIABLES POR CONSOLA*/
//export TF_VAR_europe_cidr="10.10.0.0/16"
//env | grep TF
//terraform plan -var oregon_cidr="10.20.0.0/16"