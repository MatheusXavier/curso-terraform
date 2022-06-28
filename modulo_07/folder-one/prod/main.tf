resource "azurerm_resource_group" "rg" {
  name     = "Xavier-Resource-Group-${lower(var.environment)}"
  location = var.location
  tags = {
    "environment" = var.environment
    "product"     = var.product
  }
}

resource "azurerm_service_plan" "plan" {
  name                = "Xavier-Service-Plan-${lower(var.environment)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Windows"
  sku_name            = "B1"
  tags = {
    "environment" = var.environment
    "product"     = var.product
  }
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "xavier-web-app-${lower(var.environment)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.plan.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v6.0"
    }
  }

  app_settings = {
    "chave" = "123456"
  }

  tags = {
    "environment" = var.environment
    "product"     = var.product
  }
}
