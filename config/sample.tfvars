public_ip_address_to_allow = ""

# Services
create_vm_linux   = true
create_vm_windows = true
create_mssql      = false


# Virtual Machine: Linux
vm_linux_size      = "Standard_B2ats_v2"
vm_linux_image_sku = "22_04-lts"

# Virtual Machine: Windows
vm_windows_size = "Standard_B2als_v2"

# Azure SQL Server
mssql_sku                           = "Basic"
mssql_max_size_gb                   = 2
mssql_public_network_access_enabled = true
mssql_admin_login                   = "sqladmin"
mssql_admin_login_password          = "P4ssw0rd!2023"

# App Service
appservice_sku_name = "B1"
