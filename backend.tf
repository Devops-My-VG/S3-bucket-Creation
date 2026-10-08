terraform {
  backend "s3" {
    bucket         = "terraform-state-414100287492-us-east-1"
    key            = "s3-bucket/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
