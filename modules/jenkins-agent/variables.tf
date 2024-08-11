variable "ami" {
  description = "The AMI ID to use for the Jenkins instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the Jenkins instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the Jenkins instance in"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to associate with the Jenkins instance"
  type        = string
}

variable "key_name" {
  type = string
  default = "jenkins-agent"
}
