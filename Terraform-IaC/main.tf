###########################################################
# Project 3: DevSecOps Docker Host Infrastructure (main.tf)
# ---------------------------------------------------------
# This file provisions:
# - A security group allowing SSH and HTTP access
# - A single EC2 instance with Docker and Juice Shop
# - Setup script installs Docker and runs Docker Compose
###########################################################

# Specify the AWS provider and region
provider "aws" {
    region = "ap-southeast-2" # Change accordingly
}

# Use default VPC for simplicity
data "aws_vpc" "default" {
    default = true
}

# Security group: SSH (port 22) and HTTP (port 3000)
resource "aws_security_group" "allow_ssh_http" {
    name = "P3-devsecops-sg"
    description = "Allow SSH from IP and HTTP access to Juice Shop"
    vpc_id = data.aws_vpc.default.id

    # Allow SSH only from my IP
    ingress {
        description = "SSH from my IP"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.pub_ip]
    }

    # Allow public access to Juice Shop on port 3000
    ingress {
        description = "Juice Shop (HTTP)"
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ## Allow all outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

##############################
# Amazon Linux 2 - Docker Host
##############################
module "docker_host" {
    source = "Instances/Amazon_Linux2_Instance"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    securiyy_group_id = aws_security_group.allow_ssh_http.id
}

#################################
# Windows Server 2022 - Blue Team
#################################
module "windows_server" {
    source = "Instances/Windows_2022_Instance"
    ami_id = var.windows_ami_id
    instance_type = var.windows_instance_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    security_group_id = aws_security_group.allow_ssh_http.id
}