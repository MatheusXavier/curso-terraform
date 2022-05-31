terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }

    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "random" {

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgstorage" {
  name     = "XavierResourceGroup"
  location = "brazilsouth"
}

resource "random_string" "random" {
  length  = 10
  special = false
  upper   = false
  number  = false
}

resource "azurerm_storage_account" "storagetf" {
  name                     = random_string.random.result
  resource_group_name      = "XavierResourceGroup"
  location                 = "brazilsouth"
  account_tier             = "Standard"
  access_tier              = "Hot"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                 = "terraformstate"
  storage_account_name = azurerm_storage_account.storagetf.name
  depends_on = [
    azurerm_storage_account.storagetf
  ]
}

output "blobstorage-name" {
  value = azurerm_storage_account.storagetf.name
}
