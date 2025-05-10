terraform {
  backend "s3" {
    bucket = "three-tier-architecture-buket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "terraform-state-lock"
  }
}
