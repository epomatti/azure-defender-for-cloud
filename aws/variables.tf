variable "aws_region" {
  type = string
}

variable "create_linux_instance" {
  type = bool
}

variable "linux_instance_type" {
  type = string
}

variable "linux_ami" {
  type = string
}

variable "create_windows_instance" {
  type = bool
}

variable "windows_instance_type" {
  type = string
}

variable "windows_ami" {
  type = string
}
