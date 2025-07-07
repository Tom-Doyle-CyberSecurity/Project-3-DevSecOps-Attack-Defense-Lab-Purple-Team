output "A2_pub_ip" {
    description = "Public IP of Amazon Linux 2 instance"
    value = aws_instance.docker_host.public_ip
}