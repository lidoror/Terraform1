terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = ""
    key    = ""
    region = ""
    dynamodb_table = ""
  }


  required_version = ">= 1.2.0"
}
