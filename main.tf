module "jenkins" {
  source = "../../../modules/jenkins-controller"

  ami               = "ami-0c38b837cd80f13bb" # ubuntu AMI
  instance_type     = "t2.micro"
  subnet_id         = data.aws_subnet.public.id
  security_group_id = aws_security_group.jenkins_sg.id
}

resource "aws_security_group" "jenkins_sg" {
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 8080
    to_port     = 8080
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
