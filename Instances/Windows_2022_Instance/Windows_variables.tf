# Windows Server 2022 VM
variable "windows_ami_id" {
    description = "AMI ID for Windows Server 2022"
    type = string
}

variable "instance_type" {
    description = "Instance type for Windows Server 2022"
    type = string
}

variable "key_name" {
    description = "Key name for Windows Server 2022"
    type = string
}

variable "subnet_id" {
    description = "Subnet ID for Windows Server 2022"
    type = string
}

variable "security_group_id" {
    description = "Security group ID for Windows Sever 2022"
    type = string
}