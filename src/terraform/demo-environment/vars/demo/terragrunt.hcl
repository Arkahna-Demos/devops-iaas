remote_state = {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    # You need to update the resource group and storage account here. 
    # You should have created these with the Prepare.ps1 script.
    resource_group_name  = "devops-iaas"
    storage_account_name = "devopssttfstate"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}

inputs = {
  tenant_id                             = "0fee3d31-b963-4a1c-8f4a-ca367205aa65"
  subscription_id                       = "1ac24a19-378c-4d2e-b863-46ac934f3165"
  resource_location                     = "Australia East"
  resource_group_name                   = "devops-iaas"
  owner_tag                             = "arkahna.io"
  environment_tag                       = "demo"  
} 


