/*
terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "eu-north-1"
    bucket         = "exampleguzmi-prod-terraform-state"
    key            = "terraform.tfstate"
    dynamodb_table = "exampleguzmi-prod-terraform-state-lock"
    profile        = ""
    //role_arn       = ""
    encrypt        = "true"
  }
}
*/