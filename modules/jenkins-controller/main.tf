resource "aws_instance" "jenkins_master" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name          = var.key_name

  user_data = <<-EOF
                #!/bin/bash
                apt-get update -y
                apt-get upgrade -y
                apt-get install -y docker.io
                systemctl start docker
                systemctl enable docker
                usermod -aG docker ubuntu
                docker run -d -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
              EOF

  tags = {
    Name = "Jenkins-Master"
  }
}
