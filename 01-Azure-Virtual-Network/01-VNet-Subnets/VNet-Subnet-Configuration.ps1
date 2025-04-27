# Create a resource group
# This resource group will be used in most exercises
New-AzResourceGroup -Name "RG-Labs-AZ104" -Location "EastUS"


# Create subnet configurations and assign them to the variable "$subnets"
$subnets = @(
    New-AzVirtualNetworkSubnetConfig -Name "Subnet01" -AddressPrefix "10.0.1.0/24"
    New-AzVirtualNetworkSubnetConfig -Name "Subnet02" -AddressPrefix "10.0.2.0/24")


# Create a virtual network with two subnets in the AZ-104 labs resource group
New-AzVirtualNetwork -Name "Labs-Network" -ResourceGroupName "RG-Labs-AZ104" `
  -Location "EastUS" -AddressPrefix "10.0.0.0/16" -Subnet $subnets
