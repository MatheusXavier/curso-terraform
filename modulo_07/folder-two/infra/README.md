You can run the following commands:

```
terraform init
terraform validate
```

## Development environment commands:
```
terraform plan -var-file="dev/main.tfvars" -state="dev/main.tfstate" -out="dev/main.tfplan"
terraform apply -var-file="dev/main.tfvars" -state="dev/main.tfstate" -auto-approve
terraform destroy -var-file="dev/main.tfvars" -state="dev/main.tfstate" -auto-approve
```

## Stage environment commands:
```
terraform plan -var-file="stage/main.tfvars" -state="stage/main.tfstate" -out="stage/main.tfplan"
terraform apply -var-file="stage/main.tfvars" -state="stage/main.tfstate" -auto-approve
terraform destroy -var-file="stage/main.tfvars" -state="stage/main.tfstate" -auto-approve
```

## Production environment commands:
```
terraform plan -var-file="prod/main.tfvars" -state="prod/main.tfstate" -out="prod/main.tfplan"
terraform apply -var-file="prod/main.tfvars" -state="prod/main.tfstate" -auto-approve
terraform destroy -var-file="prod/main.tfvars" -state="prod/main.tfstate" -auto-approve
```