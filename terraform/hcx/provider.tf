terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.39.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Project   = "Demo"
      ManagedBy = "Terraform"
    }
  }
  region = var.region
}
