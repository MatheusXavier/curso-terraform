remote_state {
    backend = "azurerm"
    config = {
        resource_group_name = "terraformstate"
        storage_account_name = "tfstateaztreinamento"
        container_name = "terraformstate"
        key = "you_key_goes_here"
    }
}


inputs = {
    location = "brazilsouth"
    rg = "rg-terragrunt"
}