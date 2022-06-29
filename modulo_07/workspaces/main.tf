terraform {
  backend "azurerm" {
    resource_group_name  = "resource_group_name_goes_here"
    storage_account_name = "azure_storage_account_name_goes_here"
    container_name       = "storage_container_name_goes_here"
    key                  = "key_goes_here"
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

resource "azurerm_resource_group" "rg" {
  name     = "Xavier-Resource-Group-${lower(terraform.workspace)}"
  location = var.location
}

resource "azurerm_service_plan" "plan" {
  name                = "Xavier-Service-Plan-${lower(terraform.workspace)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "xavier-web-app-${lower(terraform.workspace)}"
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
}

