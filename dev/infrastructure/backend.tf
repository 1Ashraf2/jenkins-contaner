terraform {
  backend "s3" {
    bucket         = "ash-ter-cert-bucket-2024"
    key            = "multi-env/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "Terraform-statefile"
  }
}
