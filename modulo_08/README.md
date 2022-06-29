# Terraform import
```
terraform import <Terraform Resource Name>.<Resource Label> <Azure Resource ID>
```

# Commands
```
terraform init
terraform state list
terraform import azurerm_resource_group.rg <Resource Group Id>
terraform improte azurerm_app_service_plan.plan <App Service Plan Resource Id>
terraform importe azurerm_windows_web_app.webapp <Web App Resource Id>

az group list
az group show --name <Resource Group Name>
```

# Changes
After resource importation we can change some properties and these properties will be appended to resource.