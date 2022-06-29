terraform {
  backend "azurerm" {
    resource_group_name  = "resource_group_name_goes_here"
    storage_account_name = "azure_storage_account_name_goes_here"
    container_name       = "storage_container_name_goes_here"
    key                  = "key_goes_here"
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
