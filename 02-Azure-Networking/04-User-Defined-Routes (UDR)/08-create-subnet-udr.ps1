# This script creates a new subnet named "Subnet-UDR" as part of the second exercise.

# Variables
$resourceGroup = "RG-Labs-AZ104"
$location = "EastUS"
$vnetName = "Labs-Network"
$subnetName = "Subnet-UDR"
$subnetPrefix = "10.0.4.0/24"

# Get the virtual network
$vnet = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup

# Add the new subnet
Add-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix $subnetPrefix -VirtualNetwork $vnet

# Save the changes to the virtual network
Set-AzVirtualNetwork -VirtualNetwork $vnet
