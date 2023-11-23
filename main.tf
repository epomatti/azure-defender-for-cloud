terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.81.0"
    }
  }
}

locals {
  workload = "bigbank79"
}

resource "azurerm_resource_group" "default" {
  name     = "rg-${local.workload}"
  location = var.location
}

# module "vnet" {
#   source              = "./modules/vnet"
#   workload            = local.workload
#   resource_group_name = azurerm_resource_group.default.name
#   location            = azurerm_resource_group.default.location
# }

# module "vm" {
#   source              = "./modules/vm"
#   workload            = local.workload
#   resource_group_name = azurerm_resource_group.default.name
#   location            = azurerm_resource_group.default.location
#   subnet_id           = module.vnet.subnet_id
#   size                = var.vm_size
# }

module "mssql" {
  source   = "./modules/mssql"
  workload = local.workload
  group    = azurerm_resource_group.default.name
  location = azurerm_resource_group.default.location

  sku                           = "Basic"
  max_size_gb                   = 2
  public_ip_address_to_allow    = var.public_ip_address_to_allow
  public_network_access_enabled = var.mssql_public_network_access_enabled
  admin_admin                   = var.mssql_admin_login
  admin_login_password          = var.mssql_admin_login_password
}
