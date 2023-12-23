resource "azurerm_service_plan" "default" {
  name                = "plan-${var.workload}"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "default" {
  name                = "app-nginx-${var.workload}"
  resource_group_name = var.resource_group_name
  location            = azurerm_service_plan.default.location
  service_plan_id     = azurerm_service_plan.default.id

  public_network_access_enabled = true
  https_only                    = true

  site_config {
    always_on         = true
    health_check_path = "/"

    application_stack {
      docker_image_name = "index.docker.io/nginx:latest"
    }
  }

  app_settings = {
    DOCKER_ENABLE_CI = true
    WEBSITES_PORT    = "80"
  }
}
