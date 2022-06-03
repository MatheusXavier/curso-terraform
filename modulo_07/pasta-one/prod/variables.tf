variable "location" {
  type = string
}

variable "environment" {
  type        = string
  description = "Environments Development, Stage and Production"
}

variable "product" {
  type        = string
  description = "Resource product"
}
