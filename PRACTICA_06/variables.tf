variable "europe_cidr"{
    description = "CIDR Europe"
    type        = string
    sensitive   = true
}

variable "public_subnet" {
    description = "CIDR public subnet"
    type = string
}

variable "private_subnet" {
    description = "CIDR private subnet"
    type = string
}