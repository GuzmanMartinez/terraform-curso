resource "aws_s3_bucket" "proveedores"{
    count = 6
    bucket = "guz-bucket-${random_string.sufijo[count.index].id}"
    tags = {
        Owner        = "Guzman"
        Eviroment    = "Dev"
        Office       = "Tenerife"
    }
}

resource "random_string" "sufijo" {
    count       = 6
    length      = 8
    special     = false
    upper       = false
    numeric     = false
}

