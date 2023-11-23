variable "location" {
  type    = string
  default = "eastus2"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2pts_v2"
}

variable "public_ip_address_to_allow" {
  type = string
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
