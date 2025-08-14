# Variables
$resourceGroup = "RG-Labs-AZ104"
$location = "East US"
$vnetName = "Labs-Network"
$subnetName = "GatewaySubnet"  # Required name
$subnetAddressPrefix = "10.0.255.0/27"

# Get the existing Virtual Network
$vnet = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup

# Add the special Gateway subnet
Add-AzVirtualNetworkSubnetConfig `
    -Name $subnetName `
    -AddressPrefix $subnetAddressPrefix `
    -VirtualNetwork $vnet

# Save the changes to the virtual network
$vnet | Set-AzVirtualNetwork
