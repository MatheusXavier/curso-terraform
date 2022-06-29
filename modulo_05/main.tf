terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "resource-group" {
  count    = 5
  location = "brazilsouth"
  name     = "XavierResourceGroup-${count.index}"
  tags = {
    Environment = lower("Development")
    Product     = upper("MyApp")
    Date        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    Author      = title("matheus xavier")
  }
}

variable "vnetips" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "vnetaddress" {
  type    = list(string)
  default = ["192.168.0.0/16"]
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnetxavier"
  location            = "brazilsouth"
  resource_group_name = "XavierResourceGroup-1"
  address_space       = length(var.vnetips) > 0 ? concat(var.vnetips, var.vnetaddress) : var.vnetips
}

output "vnet-ipnumbers" {
  value = length(azurerm_virtual_network.vnet.address_space)
}
