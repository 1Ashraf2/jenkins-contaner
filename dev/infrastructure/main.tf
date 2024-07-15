module "vpc" {
  source = "../../modules/dev-vpc"

  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.azs
  aws_region         = var.aws_region
  environment        = var.environment
}
