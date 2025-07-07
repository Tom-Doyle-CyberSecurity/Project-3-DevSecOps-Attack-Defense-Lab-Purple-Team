# Launch an EC2 instance using Amazon Linux 2 and attach the security group
resource "aws_instance" "docker_host" {
    ami = var.A2_ami_id
    instance_type = var.A2_instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.security_group_id]

    # This script installs Docker and runs docker-compose on the EC2 instance
    user_data = file("${path.module}/../../setup.sh")
    tags = {
        Name = "DevSecOps-Docker-Host"
    }
}