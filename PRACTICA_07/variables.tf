variable "europe_cidr"{
    description = "CIDR Europe"
    type        = string
    sensitive   = true
}

variable "subnets" {
    description = "Lista de subnets"
    type = list(string)
}

variable "tags" {
    description = "Lista de subnets"
    type        = map(string)
}

variable "sg_ingress_cidr" {
    description = "CIDR for ingress traffic"
    type        = string
}

variable "ec2_specs" {
    description = "Parametros de la instancia"
    type        = map(string)
}

variable "enable_monitoring"{
    description ="Habilita el despliegue de un servidor de monitorieo"
    type = number

}

variable "ingress_port_list"{
    description = "Lista de puertos de ingress"
    type = list(number)
}
















/*
variable "public_subnet" {
    description = "CIDR public subnet"
    type = string
}

variable "private_subnet" {
    description = "CIDR private subnet"
    type = string
}
*/