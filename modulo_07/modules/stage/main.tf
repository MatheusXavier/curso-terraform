module "stage" {
  source = "../infra"

  location    = "brazilsouth"
  environment = "Stage"
  product     = "Xavier-Treinamento-Terraform"
}
