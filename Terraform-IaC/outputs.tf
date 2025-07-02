###############
# Output Values
###############

# Output the public IP address of the EC2 instance for the SSH or web access
output "instance_public_ip" {
    description = "Public IP of the Docker EC2 host"
    value = aws_instance.docker_host.public_ip
}