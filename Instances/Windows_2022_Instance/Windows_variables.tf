########################
# Windows Server 2022 VM
########################

# Windows AMI ID
variable "windows_ami_id" {
    description = "AMI ID for Windows Server 2022"
    type = string
}

# Windows Instance Type
variable "windows_instance_type" {
    description = "Instance type for Windows Server 2022"
    type = string
}

# Windows Key Name
variable "key_name" {
    description = "Key name for Windows Server 2022"
    type = string
}

# Windows Subnet ID
variable "subnet_id" {
    description = "Subnet ID for Windows Server 2022"
    type = string
}

# Windows Security Group
variable "security_group_id" {
    description = "Security group ID for Windows Sever 2022"
    type = string
}