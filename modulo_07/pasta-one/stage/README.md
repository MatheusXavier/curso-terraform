You can run the following commands:

```
terraform init
terraform validate
terraform plan -var-file="main.tfvars"
terraform apply -var-file="main.tfvars" -auto-approve
terraform destroy -var-file="main.tfvars" -auto-approve
```