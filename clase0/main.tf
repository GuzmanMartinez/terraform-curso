terraform {
  required_version = "~> 1.12.0"
  required_providers {
    random = { source = "hashicorp/random" }
    local  = { source = "hashicorp/local" }
  }
}

resource "random_pet" "nombre" {
  length = 2
}

resource "local_file" "saludo" {
  content  = "Hola desde ${random_pet.nombre.id}\n"
  filename = "${path.module}/saludo.txt"
}

output "mascota" {
  value = random_pet.nombre.id
}
