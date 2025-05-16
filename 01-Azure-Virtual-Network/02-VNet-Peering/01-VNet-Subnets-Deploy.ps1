# We will be using the pre-existing resource group, RG-Labs-AZ104, for this deployment

# Create subnet configurations and assign them to the variable "$subnets"

$subnets = @(
    New-AzVirtualNetworkSubnetConfig -Name "SubnetA" -AddressPrefix "10.1.1.0/24"
    New-AzVirtualNetworkSubnetConfig -Name "SubnetB" -AddressPrefix "10.1.2.0/24"
    )


# Create a virtual network with two subnets in the AZ-104 labs resource group
New-AzVirtualNetwork -Name "Labs-Network02" -ResourceGroupName "RG-Labs-AZ104" `
  -Location "EastUS" -AddressPrefix "10.1.0.0/16" -Subnet $subnets
