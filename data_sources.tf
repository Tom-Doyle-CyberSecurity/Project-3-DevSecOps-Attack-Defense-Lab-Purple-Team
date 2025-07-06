#############################################################################################################
# AWS AMI Data Sources
#
# This file dynamically retrieves the most recent AMI IDs for:
#   - Amazon Linux 2 (for the Docker Host EC2 instance)
#   - Windows Server 2022 (for the Blue Team EC2 instance)
#
# These AMI IDs are automatically fetched using AWS filters and will be referenced in the EC2 instance using:
#   - data.aws_ami.amazon_linux_2.id
#   - data.aws_ami.windows_server_2022.id
#############################################################################################################

##############################################
# Amazon Linux 2 AMI
#   - Used for the Docker Host EC2 instance
#   - Provided by AWS
#   - x86_64 architecture, HVM virtualisation
##############################################

# Lookup latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
    most_recent = true
    owners = ["amazon"] # Only fetch from official AWS account

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

###################################################
# Windows Server 2022 AMI
#   - Used for Windows Blue Team EC2 instance
#   - Provided by AWS
#   - Includes Full GUI (not core), English version
###################################################

# Lookup latest Windows Server 2022 AMI
data "aws_ami" "windows_server_2022" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["Windows_Server-2022-English-Full-Base-*"]
    }

    filter {
        name = "platform"
        values = ["windows"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}