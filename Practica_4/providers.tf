terraform{
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = ">= 4.36.0, <4.47.0, !=4.43.0"
        }
    }
    required_version = "~>1.12.0"
}

provider "aws"{
    region = "eu-north-1"
}
provider "aws"{
    region = "us-west-2"
    alias = "oregon"
}