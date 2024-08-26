terraform {
  required_version = "1.9.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-ck-dev-bucket"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
