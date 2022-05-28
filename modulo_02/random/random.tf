terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.2.0"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "random" {
  length  = 16
  special = true
}
