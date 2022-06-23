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
$imageResourceGroup='image-builder-demo'
# Region location 
$location='AustraliaEast'
# Run output name
$runOutputName='image-builder-demo'
# name of the image to be created
$imageName='demo-image'

az group create -n $imageResourceGroup -l $location