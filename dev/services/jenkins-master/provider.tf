terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "ash-ter-cert-bucket-2024"
    key            = "dev/jenkins-master/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "Terraform-statefile"
  }
}
