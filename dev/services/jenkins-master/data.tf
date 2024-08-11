data "aws_vpc" "default" {
  default = true
}


#Data sources to lookup existing subnets by tag
data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["dev-public-2"]
  }
}

