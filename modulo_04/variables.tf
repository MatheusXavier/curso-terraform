variable "name-rg" {
  type        = string
  description = "Nome do Resource Group"
  default     = "XavierResourceGroup"
}

variable "location" {
  type        = string
  description = "Localização dos Recursos do Azure. Ex: brazilsouth"
  default     = "brazilsouth"
}

variable "tags" {
  type        = map(any)
  description = "Tags nos Recursos e Servicos do Azure"
  default = {
    Environment = "Development"
    Product     = "Desk4Me"
  }
}

variable "vnetaddress" {
  type    = list(any)
  default = ["10.0.0.0/16", "192.168.0.0/16"]
}
