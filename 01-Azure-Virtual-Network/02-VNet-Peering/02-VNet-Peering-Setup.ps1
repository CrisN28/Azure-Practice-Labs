# This script sets up virtual network peering between two virtual networks

# Get the first virtual network named "Labs-Network"
$vnet1 = Get-AzVirtualNetwork -Name "Labs-Network" -ResourceGroupName "RG-Labs-AZ104"

# Get the second virtual network named "Labs-Network02"
$vnet2 = Get-AzVirtualNetwork -Name "Labs-Network02" -ResourceGroupName "RG-Labs-AZ104"


# Create peering from Labs-Network to Labs-Network02 (allow traffic)
# The .Id property returns the unique Azure resource ID of each virtual network
Add-AzVirtualNetworkPeering -Name "Labs-Network-to-Labs-Network02" `
  -VirtualNetwork $vnet1 `
  -RemoteVirtualNetworkId $vnet2.Id

# Create peering from Labs-Network02 to Labs-Network (allow traffic)
Add-AzVirtualNetworkPeering -Name "Labs-Network02-to-Labs-Network" `
  -VirtualNetwork $vnet2 `
  -RemoteVirtualNetworkId $vnet1.Id


# These commands verify that virtual network peering exists in both directions
Get-AzVirtualNetworkPeering -ResourceGroupName "RG-Labs-AZ104" -VirtualNetworkName "Labs-Network" | Format-Table Name, PeeringState, RemoteVirtualNetworkId
Get-AzVirtualNetworkPeering -ResourceGroupName "RG-Labs-AZ104" -VirtualNetworkName "Labs-Network02" | Format-Table Name, PeeringState, RemoteVirtualNetworkId