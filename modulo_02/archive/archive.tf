terraform {
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.2.0"
    }
  }
}

provider "archive" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

resource "random_string" "random" {
  length  = 16
  special = false
}

data "archive_file" "arquivozip" {
  type        = "zip"
  source_dir  = "data_backup"
  output_path = "backup_dir_${random_string.random.result}.zip"
}

output "random_string" {
  value = random_string.random.result
}

output "arquivozip" {
  value = data.archive_file.arquivozip.output_size
}

output "aruivozipname" {
  value = data.archive_file.arquivozip.output_path
}
