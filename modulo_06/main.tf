terraform {
  backend "azurerm" {
    resource_group_name  = "BeWelcome-Development"
    storage_account_name = "bewelcomestoragedev"
    container_name       = "terraformstate"
    key                  = "[yourkeygoeshere]"
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "rg-state" {
  name     = "XavierResourceGroup"
  location = "brazilsouth"
}
