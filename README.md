# curso-terraform
This is a repository that contains all code that I have produced from Terraform on Azure course

# Commands
Running commands with **auto approve**:
> terraform apply -auto-approve

> terraform destroy -auto-approve

Running with **.tfvars**:
> terraform plan -var-file="values.tfvars"

> terraform apply -var-file="values.tfvars"

> terraform destroy -var-file="values.tfvars"

We can overwrite a variable using in the command like this:
> terraform plan -var-file="values.tfvars" -var "location=westus"

> terraform apply -var-file="values.tfvars" -var "location=westus"