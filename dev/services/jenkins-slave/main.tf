data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["dev-public-1"]
  }
}
