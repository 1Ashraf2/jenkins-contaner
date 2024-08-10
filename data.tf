data "aws_vpc" "default" {
  default = true
}

# data "aws_subnets" "public_subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default.id]
#   }
# }

#Data sources to lookup existing subnets by tag
data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["dev-public-2"]
  }
}
