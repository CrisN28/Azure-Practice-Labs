
# Obtener la red virtual
$vnet = Get-AzVirtualNetwork -Name "Labs-Network02" -ResourceGroupName "RG-Labs-AZ104"

$subnetConfig = Add-AzVirtualNetworkSubnetConfig `
   -Name "AD-Subnet" `
   -AddressPrefix "10.1.3.0/24" `
   -VirtualNetwork $vnet

$vnet | Set-AzVirtualNetwork


# DEPLOY THE VM 

New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "01-AD-VM-template.json" `
  -TemplateParameterFile "02-AD-VM-parameters.json"
