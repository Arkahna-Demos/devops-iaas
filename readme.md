# Ensure the resource providers are set
az provider show -n Microsoft.VirtualMachineImages | grep registrationState
az provider show -n Microsoft.KeyVault | grep registrationState
az provider show -n Microsoft.Compute | grep registrationState
az provider show -n Microsoft.Storage | grep registrationState
az provider show -n Microsoft.Network | grep registrationState


az provider register -n Microsoft.VirtualMachineImages
az provider register -n Microsoft.KeyVault
az provider register -n Microsoft.Compute 
az provider register -n Microsoft.Storage 
az provider register -n Microsoft.Network 


# Login
az login

$subscriptionId = '1ac24a19-378c-4d2e-b863-46ac934f3165'

az account set --subscription $subscriptionId


# Create RG
$imageResourceGroup='devops-iaas'
# Region location 
$location='AustraliaEast'

az group create -n $imageResourceGroup -l $location

# Install Packer
https://www.packer.io/downloads

# Create Packer credentials
az ad sp create-for-rbac -n $imageResourceGroup --role Contributor --scopes /subscriptions/$subscriptionId --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"


# Packer Build Steps (Create a Managed Image using Packer)
$Env:client_id = ""
$Env:client_secret = ""
$Env:tenant_id = ""
$Env:subscription_id =  $subscriptionId
$image_name = "devops-mi-nginx-001"
$vm_name = "myVM"

packer build  -var tenant_id=$Env:tenant_id -var client_id=$Env:client_id -var client_secret=$Env:client_secret -var subscription_id=$Env:subscription_id -var resource_group_name=$imageResourceGroup -var managed_image_name=$image_name linux-nginx-azure.json


# Extend Packer with Ansible
linux-nginx-azure contains an ansible playbook

# Create a VM from the image
az vm create --resource-group $imageResourceGroup --name $vm_name  --image $image_name --admin-username azureuser --generate-ssh-keys

az vm open-port --resource-group $imageResourceGroup --name $vm_name  --port 80

# Deploying Infrastructure with Terraform
terragrunt plan --terragrunt-config vars/local/terragrunt.hcl
terragrunt apply --terragrunt-config vars/local/terragrunt.hcl


# References and other reading
https://medium.com/techno101/packer-a-complete-guide-with-example-cf062b7495eb
https://www.digitalocean.com/community/tutorials/how-to-deploy-a-static-html-website-with-ansible-on-ubuntu-20-04-nginx
https://graspingtech.com/ansible-nginx-static-site/