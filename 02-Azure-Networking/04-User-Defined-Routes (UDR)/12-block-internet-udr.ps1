# -----------------------------------------------Create a Custom Route Table------------------------------------------------

# Variables
$resourceGroup = "RG-Labs-AZ104"
$routeTableName = "RT-BlockInternet"
$location = "EastUS"

# Create an empty route table
New-AzRouteTable -Name $routeTableName `
  -ResourceGroupName $resourceGroup `
  -Location $location

# -------------------------------------------Add a Route to Block Internet Access-------------------------------------------

$routeName = "Block-Internet"   # Name of the route to block traffic
$addressPrefix = "0.0.0.0/0"    # All external traffic (Internet)
$nextHopType = "None"           # No next hop → blocks the traffic

# Get the existing route table
$routeTable = Get-AzRouteTable -Name $routeTableName -ResourceGroupName $resourceGroup

# Add a new route that blocks outbound traffic to the Internet
Add-AzRouteConfig -Name $routeName `
  -AddressPrefix $addressPrefix `
  -NextHopType $nextHopType `
  -RouteTable $routeTable

# Save the updated route table
$routeTable | Set-AzRouteTable

# -------------------------------------------Associate the Route Table to a Subnet-------------------------------------------

$vnetName = "Labs-Network"
$subnetName = "Subnet-UDR"

# Get the virtual network
$vnet = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup

# Get the updated route table
$routeTable = Get-AzRouteTable -Name $routeTableName -ResourceGroupName $resourceGroup

# Get the existing subnet address prefix (to avoid overwriting it)
$subnetPrefix = ($vnet.Subnets | Where-Object { $_.Name -eq $subnetName }).AddressPrefix

# Configure the subnet to use the route table
Set-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet `
  -Name $subnetName `
  -AddressPrefix $subnetPrefix `
  -RouteTable $routeTable

# Apply the changes to the virtual network
$vnet | Set-AzVirtualNetwork

# -----------------------------------------------------------Test------------------------------------------------------------

# Sends 4 ICMP (ping) packets to Google's public DNS server (8.8.8.8) to verify Internet connectivity.

# ping 8.8.8.8 -c 4
# output "4 packets transmitted, 0 received, 100% packet loss"
# It means the VM does not have Internet access.
