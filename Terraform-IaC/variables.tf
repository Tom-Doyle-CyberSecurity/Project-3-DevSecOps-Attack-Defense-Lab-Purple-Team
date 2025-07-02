##############################################
# Input-Variables for DevSecOps Infrastructure
##############################################

# AMI ID
variable "ami_id" {
    description = "AMI ID of the EC2 instance"
    type = string
}

# Name of the key pair for SSH access (must exist in AWS / preferred cloud provider)
variable "key_name" {
    description = "Name of existing AWS EC2 key pair"
    type = string
}

# Public IP address in the CIDR notation to restrict SSH access
variable "pub_ip" {
    description = "Public IP address with /32"
    type = string
}

# Size/type of EC2 instance to provision
variable "instance_type" {
    description = "AWS EC2 instance_type"
    type = string
    default = "t3.micro"
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