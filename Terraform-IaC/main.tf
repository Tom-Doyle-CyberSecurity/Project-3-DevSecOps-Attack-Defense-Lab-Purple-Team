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
    region = "ap-southeasst-2" # Change accordingly
}

# Fetch the default VPC in the region
data "aws_vpc" "default" {
    default = true
}

# Define a security group to allow SSH (port 22) and HTTP (port 3000)
resource "aws_security_group" "allow_ssh_http" {
    name = "P3-devsecops-sg"
    description = "Allow SSH from IP and HTTP access to Juice Shop"
    vpc_id = data.aws_vpc.default.id

    # Allow SSH only from my IP
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }

    # Allow public access to Juice Shop on port 3000
    ingress {
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

# Launch an EC2 instance using Amazon Linux 2 and attach the security group
resource "aws_instance" "docker_host" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

    # This script installs Docker and runs docker-compose on the EC2 instance
    user_data = file("${path.module}/../setup.sh")
    tags = {
        Name = "DevSecOps-Docker-Host"
    }
}