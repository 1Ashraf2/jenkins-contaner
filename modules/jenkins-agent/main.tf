resource "aws_instance" "jenkins_agent" {
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  key_name          = var.key_name

  user_data = <<-EOF
                #!/bin/bash
                # Update the package list and install dependencies
                apt-get update -y
                apt-get install -y docker.io unzip curl

                # Start and enable Docker
                systemctl start docker
                systemctl enable docker
                usermod -aG docker ubuntu

                # Install AWS CLI
                curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                unzip awscliv2.zip
                sudo ./aws/install

                # Install Terraform
                curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
                apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
                apt-get update -y && apt-get install terraform -y

                # Run Jenkins agent container
                docker run -d --name jenkins-agent -p 50000:50000 jenkins/agent
              EOF
    tags = {
    Name = "Jenkins-Agent"
  }
}
