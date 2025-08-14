# First, we need to get the full ID of the virtual network to link

# Variables
$rg = "RG-Labs-AZ104"
$vnetName = "Labs-Network02"
$templateFile = "01-privateDnsZone-template.json"
$parameterFile = "02-privateDnsZone-parameters.json"

# Get the Virtual Network
$vnet = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $rg

# Get the full ID of your virtual network
$vnet.Id

# Deploy the DNS Private Zone
New-AzResourceGroupDeployment -ResourceGroupName $rg `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile
