
# Set variables
$resourceGroup = "RG-Labs-AZ104"
$vnetName = "Labs-Network"

# Get the existing Virtual Network object
$vnet = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup

# Add subnet for Application Gateway
$vnet = Add-AzVirtualNetworkSubnetConfig `
    -Name "subnet-gateway" `
    -AddressPrefix "10.0.3.0/24" `
    -VirtualNetwork $vnet

# Add subnet for backend virtual machines
$vnet = Add-AzVirtualNetworkSubnetConfig `
    -Name "subnet-backend" `
    -AddressPrefix "10.0.4.0/24" `
    -VirtualNetwork $vnet

# Apply the changes to the Virtual Network
Set-AzVirtualNetwork -VirtualNetwork $vnet

-------------------------------------------------------------------------------------------------------------------------------------------------


# Variables

$nsgName = "nsg-backend"
$subnetName = "subnet-backend"
$location = "East US"

# 1. Create a new Network Security Group (NSG)
$nsg = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroup -Location $location -Name $nsgName

# 2. Create a security rule to allow inbound HTTP traffic on port 80
$rule = New-AzNetworkSecurityRuleConfig -Name "Allow-HTTP" `
    -Description "Allow inbound HTTP traffic" `
    -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
    -SourceAddressPrefix * -SourcePortRange * `
    -DestinationAddressPrefix * -DestinationPortRange 80

# 3. Add the rule to the NSG
$nsg.SecurityRules.Add($rule)

# 4. Update the NSG with the new rule
Set-AzNetworkSecurityGroup -NetworkSecurityGroup $nsg

# 5. Get the existing virtual network
$vnet = Get-AzVirtualNetwork -ResourceGroupName $resourceGroup -Name $vnetName
$subnet = $vnet.Subnets | Where-Object { $_.Name -eq $subnetName }

# 6. Associate the NSG to the backend subnet
Set-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetName -AddressPrefix $subnet.AddressPrefix -NetworkSecurityGroup $nsg

# 7. Apply the subnet configuration update to the virtual network
Set-AzVirtualNetwork -VirtualNetwork $vnet
