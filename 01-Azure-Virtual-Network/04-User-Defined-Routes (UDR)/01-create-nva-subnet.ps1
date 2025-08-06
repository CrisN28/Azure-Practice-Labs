# This script creates a new subnet named "nva-subnet" as part of the first exercise.

# Variables
$rg = "RG-Labs-AZ104"
$vnetName = "Labs-Network"
$newSubnetName = "nva-subnet"
$newSubnetPrefix = "10.0.3.0/24"

# Get the virtual network
$vnet = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $rg

# Add the new subnet
Add-AzVirtualNetworkSubnetConfig -Name $newSubnetName -AddressPrefix $newSubnetPrefix -VirtualNetwork $vnet

# Save the changes to the virtual network
Set-AzVirtualNetwork -VirtualNetwork $vnet
