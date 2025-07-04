##########################
# Amazon Linux 2 Variables
##########################

# AMI ID
variable "A2_ami_id" {
    description = "AMI ID of Amazon Linux 2"
    type = string
}

# Instance type
variable "A2_instance_type" {
    description = "Instance Type"
    type = string
}

# Key name
variable "key_name" {
    description = "Key name"
    type = string
}

# Subnet ID
variable "subnet_id" {
    description = "Subnet ID"
    type = string
}

# Security Group ID
variable "security_group_id" {
    description = "Security Group ID"
    type = string
}