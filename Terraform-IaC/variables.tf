#####################################################
# Shared Input-Variables for DevSecOps Infrastructure
#####################################################

# Amazon 2 AMI ID
variable "A2_ami_id" {
    description = "AMI ID for Amazon Linux 2"
    type = string
}

# Amazon Linux 2 Instance Type
variable "A2_instance_type" {
    description = "Instance Type for Amazon Linux 2"
    type = string
}

# Windows 2022 AMI ID
variable "windows_ami_id" {
    description = "AMI ID for Windows 2022 Server"
    type = string
}

# Windows Instance Type
variable "windows_instance_type" {
    description = "Instance Type for Windows 2022 Server"
    type = string
}

# Name of the key pair for SSH access (must exist in AWS / preferred cloud provider) - shared values
variable "key_name" {
    description = "Name of existing AWS EC2 key pair"
    type = string
}

# VPC ID
variable "vpc_id"{
    description = "VPC ID of the EC2 instance"
    type = string
}

# Subnet ID
variable "subnet_id" {
    description = "Subnet ID of the EC2 instance"
    type = string
}

# My Pub IP
variable "my_pub_ip" {
    description = "My public IP for SSH access"
    type = string
}