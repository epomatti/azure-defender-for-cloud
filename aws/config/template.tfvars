aws_region = "us-east-2"

# Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
create_linux_instance = true
linux_ami             = "ami-05fb0b8c1424f266b"
linux_instance_type   = "t3a.medium"

# Microsoft Windows Server 2022 Full Locale English AMI provided by Amazon
create_windows_instance = false
windows_ami             = "ami-094aa6728b151e05a"
windows_instance_type   = "t3.large"
