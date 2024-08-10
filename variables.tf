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
  default = "subnet-0e3fa8a1efbfaf46b"
}

variable "cidr_block1" {
  type = string
  default = "172.31.108.0/24"
}

variable "cidr_block2" {
  type = string
  default = "172.31.112.0/24"
}