terraform {
  required_version = ">= 1.5.0"

  cloud {
    organization = "your-hcp-org-name"   # ⬅️ Replace with your HCP Terraform organization name
    workspaces {
      name = "aws-hcp-vpc-demo"          # ⬅️ Replace with your HCP workspace name
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}
