variable "location" {
  type    = string
  default = "eastus2"
}

# Create toggles
variable "create_vm_linux" {
  type = bool
}

variable "create_vm_windows" {
  type = bool
}

variable "create_antimalware_vm_windows" {
  type = bool
}

variable "create_mssql" {
  type = bool
}

# Virutal Machine - Linux
variable "vm_linux_size" {
  type = string
}

variable "vm_linux_image_sku" {
  type = string
}

# Virtual Machine - Windows
variable "vm_windows_size" {
  type = string
}

# Azure SQL Server
variable "public_ip_address_to_allow" {
  type = string
}

variable "mssql_sku" {
  type = string
}

variable "mssql_max_size_gb" {
  type = number
}

variable "mssql_public_network_access_enabled" {
  type = bool
}

variable "mssql_admin_login" {
  type = string
}

variable "mssql_admin_login_password" {
  type = string
}

## App Service
variable "appservice_sku_name" {
  type = string
}
