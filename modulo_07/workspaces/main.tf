terraform {
  backend "azurerm" {
    resource_group_name  = "BeWelcome-Development"
    storage_account_name = "bewelcomestoragedev"
    container_name       = "terraformstate"
    key                  = "0JzOylBaF8BPHcni3aVcI6LrczOu8AlAAPIJvKo4JueV6pyQbM5KOvbSTOVyNXlOgtLljkZQrmGM+AStIeYitw=="
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

