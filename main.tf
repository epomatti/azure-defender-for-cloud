terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.92.0"
    }
  }
}

locals {
  workload = "bigbank"
}

resource "azurerm_resource_group" "default" {
  name     = "rg-${local.workload}"
  location = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  workload            = local.workload
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
}

resource "azurerm_log_analytics_workspace" "default" {
  name                = "log-${local.workload}"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

module "vm_linux" {
  count               = var.create_vm_linux == true ? 1 : 0
  source              = "./modules/vm/linux"
  workload            = local.workload
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  subnet_id           = module.vnet.subnet_id
  size                = var.vm_linux_size
  image_sku           = var.vm_linux_image_sku
}

module "vm_windows" {
  count               = var.create_vm_windows == true ? 1 : 0
  source              = "./modules/vm/windows"
  workload            = local.workload
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  subnet_id           = module.vnet.subnet_id
  size                = var.vm_windows_size
}

module "vm_antimalware" {
  count               = var.create_antimalware_vm_windows == true ? 1 : 0
  source              = "./modules/antimalware"
  workload            = local.workload
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  subnet_id           = module.vnet.subnet_id
  size                = var.vm_windows_size
}

module "keyvault" {
  source   = "./modules/keyvault"
  workload = local.workload
  group    = azurerm_resource_group.default.name
  location = azurerm_resource_group.default.location
}

module "mssql" {
  count    = var.create_mssql_server == true ? 1 : 0
  source   = "./modules/mssql"
  workload = local.workload
  group    = azurerm_resource_group.default.name
  location = azurerm_resource_group.default.location

  public_ip_address_to_allow    = var.public_ip_address_to_allow
  sku                           = var.mssql_sku
  max_size_gb                   = var.mssql_max_size_gb
  public_network_access_enabled = var.mssql_public_network_access_enabled
  admin_admin                   = var.mssql_admin_login
  admin_login_password          = var.mssql_admin_login_password
}

module "logic_app" {
  source   = "./modules/logicapp"
  workload = local.workload
  group    = azurerm_resource_group.default.name
  location = azurerm_resource_group.default.location
}

module "webapp" {
  source              = "./modules/webapp"
  workload            = local.workload
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  sku_name            = var.appservice_sku_name
}
