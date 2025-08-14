# This script creates a route table and a custom route for the "subnet01".

# Variables
$rg = "RG-Labs-AZ104"
$routeTableName = "UDR-Subnet01-to-NVA"
$location = "eastus"
$subnetName = "subnet01"
$vnetName = "Labs-Network"
$nvaIp = "10.0.3.4"  # subnet03 prefix

# 1. Create the route table and save the object in a variable
$routeTable = New-AzRouteTable -ResourceGroupName $rg -Name $routeTableName -Location $location

# 2. Create the route that directs traffic to subnet02 via the NVA
Add-AzRouteConfig -Name "route-to-subnet02-via-NVA" `
  -AddressPrefix "10.0.2.0/24" `
  -NextHopType "VirtualAppliance" `
  -NextHopIpAddress $nvaIp `
  -RouteTable $routeTable

# 3. Save the route table with the new route
$routeTable | Set-AzRouteTable

# 4. Get the virtual network to modify the subnet
$vnet = Get-AzVirtualNetwork -ResourceGroupName $rg -Name $vnetName

# 5. Get the address prefix of subnet01 to keep it unchanged
$subnetPrefix = ($vnet.Subnets | Where-Object { $_.Name -eq $subnetName }).AddressPrefix

# 6. Associate the route table to subnet01
Set-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet `
  -Name $subnetName `
  -AddressPrefix $subnetPrefix `
  -RouteTable $routeTable

# 7. Apply the changes to the virtual network
$vnet | Set-AzVirtualNetwork
