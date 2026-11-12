output "ec_public_ip"{
    description = "Ip publica de al instancia"
    value       = aws_instance.public_instance.public_ip
}