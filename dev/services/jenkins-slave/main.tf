data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["dev-public-1"]
  }
}

module "jenkins_agent" {
  source            = "../../../modules/jenkins-agent"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         =data.aws_subnet.public.id
  security_group_id = aws_security_group.jenkins_agent_sg.id
}

resource "aws_security_group" "jenkins_agent_sg" {
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
