module "dev" {
  source = "../infra"

  location    = "brazilsouth"
  environment = "Development"
  product     = "Xavier-Treinamento-Terraform"
}
