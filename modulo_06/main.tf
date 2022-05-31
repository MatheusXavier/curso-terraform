terraform {
  backend "azurerm" {
    resource_group_name  = "BeWelcome-Development"
    storage_account_name = "bewelcomestoragedev"
    container_name       = "terraformstate"
    key                  = "pGItxp0iS7RFz/Eq1jN44yq7eCo7Fs4zxaC8NKnhSijM10DWSf3yvKJZ2JBfZ671FPhlPQvSjOHUCzv6p9Z39g=="
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
