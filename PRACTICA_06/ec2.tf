resource "aws_instance" "public_instance"{
    ami            = "ami-0f71b90bee7050a75"
    instance_type  = "t3.micro"
    subnet_id  = aws_subnet.public_subnet.id


}