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