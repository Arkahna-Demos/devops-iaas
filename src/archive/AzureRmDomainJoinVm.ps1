#Login-AzureRMAccount

Select-AzureRmSubscription -SubscriptionId a04e48f9-87ca-41ba-a929-82d05d9dae7a

$VMName = "WVD-1"
$rgname = "something-rg"
$locName = "australiaeast"
$DomainName = "domain.org.au"
$DomainJoinAdminName = "user@domain.com.au"
$DomainJoinPassword = "password"

#Get-AzureRmVM -ResourceGroupName $RGName -Name $vmName -Status

#Get-AzureRmVMExtension -VMName $VMName –ResourceGroupName $rgname -Name "JoinAD"

#Get-AzureRmVMExtension -VMName $VMName –ResourceGroupName $rgname

#Remove-AzureRmVMExtension -VMName $VMName –ResourceGroupName $rgname -Name "JoinAD"


Set-AzureRMVMExtension -VMName $VMName –ResourceGroupName $rgname -Name "JoinAD" -ExtensionType "JsonADDomainExtension" -Publisher "Microsoft.Compute" -TypeHandlerVersion "1.0" -Location $locName -Settings @{ "Name" = $DomainName; "User" = $DomainJoinAdminName; "Restart" = "true"; "Options" = 3} -ProtectedSettings @{ "Password" = $DomainJoinPassword}

