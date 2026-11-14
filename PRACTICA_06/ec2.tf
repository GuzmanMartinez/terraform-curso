resource "aws_instance" "public_instance"{
    ami            = "ami-0f71b90bee7050a75"
    instance_type  = "t3.micro"
    subnet_id      = aws_subnet.public_subnet.id
    key_name = data.aws_key_pair.key.key_name
}

#lifecycle {
#    replace_triggered_by = [
#        aws_subnet.private_subnet.id
#    ]
#}