# This script creates a route table and a custom route for the "subnet02".

# Variables
$rg = "RG-Labs-AZ104"
$location = "eastus"
$vnetName = "Labs-Network"
$routeTableNameReturn = "UDR-Subnet02-to-NVA"
$subnetNameReturn = "subnet02"
$nvaIp = "10.0.3.4"                    # subnet03 prefix
$addressPrefixReturn = "10.0.1.0/24"   # subnet01 prefix

# 1. Create the route table for subnet02 and save the object
$routeTableReturn = New-AzRouteTable -ResourceGroupName $rg -Name $routeTableNameReturn -Location $location

# 2. Create the route that directs traffic to subnet01 via the NVA
Add-AzRouteConfig -Name "route-to-subnet01-via-NVA" `
  -AddressPrefix $addressPrefixReturn `
  -NextHopType "VirtualAppliance" `
  -NextHopIpAddress $nvaIp `
  -RouteTable $routeTableReturn

# 3. Save the route table with the new route
$routeTableReturn | Set-AzRouteTable

# 4. Get the virtual network to modify subnet subnet02
$vnet = Get-AzVirtualNetwork -ResourceGroupName $rg -Name $vnetName

# 5. Get the address prefix of subnet02 to keep it unchanged
$subnetPrefixReturn = ($vnet.Subnets | Where-Object { $_.Name -eq $subnetNameReturn }).AddressPrefix

# 6. Associate the route table to subnet02
Set-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet `
  -Name $subnetNameReturn `
  -AddressPrefix $subnetPrefixReturn `
  -RouteTable $routeTableReturn

# 7. Apply the changes to the virtual network
$vnet | Set-AzVirtualNetwork
