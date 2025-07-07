output "windows_public_ip" {
    description = "Windows Public IP"
    value = aws_instance.windows_server.public_ip
}