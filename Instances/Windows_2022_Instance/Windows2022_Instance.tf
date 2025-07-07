resource "aws_instance" "windows_server" {
    ami = var.windows_ami_id
    instance_type = var.windows_instance_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group_id]
    associate_public_ip_address = true
}