output "instance_id" {
  value = aws_instance.jenkins_agent.id
}

output "public_ip" {
  value = aws_instance.jenkins_agent.public_ip
}
