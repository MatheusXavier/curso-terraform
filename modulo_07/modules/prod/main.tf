module "prod" {
  source = "../infra"

  location    = "brazilsouth"
  environment = "Production"
  product     = "Xavier-Treinamento-Terraform"
}
