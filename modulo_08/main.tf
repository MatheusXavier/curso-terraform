provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {}

resource "azurerm_app_service_plan" "plan" {}

resource "azurerm_windows_web_app" "webapp" {}
