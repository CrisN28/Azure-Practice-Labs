New-AzResourceGroupDeployment `
  -ResourceGroupName RG-Labs-AZ104 `
  -TemplateFile "05-vm-ubuntu-subnet02.json"


# Variables
$nsgName = "nsg-subnet02"
$resourceGroup = "RG-Labs-AZ104"
$location = "EastUS"
$subnetName = "subnet02"
$vnetName = "Labs-Network"
$myIP = "<your-public-IP>/32"  # Example: "XXX.XXX.XX.XXX/32"

# Create the NSG
$nsg = New-AzNetworkSecurityGroup `
    -ResourceGroupName $resourceGroup `
    -Location $location `
    -Name $nsgName

# Add a rule to allow SSH (port 22) only from your public IP
$nsg | Add-AzNetworkSecurityRuleConfig `
    -Name "allow-ssh-my-ip" `
    -Description "Allow SSH from my IP" `
    -Access Allow `
    -Protocol Tcp `
    -Direction Inbound `
    -Priority 100 `
    -SourceAddressPrefix $myIP `
    -SourcePortRange * `
    -DestinationAddressPrefix * `
    -DestinationPortRange 22

# Update the NSG with the new rule
$nsg | Set-AzNetworkSecurityGroup

# Get the current subnet from the virtual network
$vnet = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup
$subnet = $vnet | Get-AzVirtualNetworkSubnetConfig -Name $subnetName

# Associate the NSG with the subnet
Set-AzVirtualNetworkSubnetConfig `
    -VirtualNetwork $vnet `
    -Name $subnetName `
    -AddressPrefix $subnet.AddressPrefix `
    -NetworkSecurityGroup $nsg

# Apply the changes to the virtual network
$vnet | Set-AzVirtualNetwork

---------------------------------------------------------------------------------------------------------------------------------------

# Variables
$nsgName = "nsg-subnet02"
$resourceGroup = "RG-Labs-AZ104"
$location = "EastUS"

# Create rule to deny HTTP (port 80)
az network nsg rule create `
  --resource-group $resourceGroup `
  --nsg-name $nsgName `
  --name "Deny-HTTP-Out" `
  --priority 200 `
  --direction Outbound `
  --access Deny `
  --protocol Tcp `
  --destination-port-ranges 80 `
  --destination-address-prefixes 0.0.0.0/0 `
  --source-address-prefixes "*" `
  --source-port-ranges "*" `
  --description "Block outbound HTTP to Internet"

# Create rule to deny HTTPS (port 443)
az network nsg rule create `
  --resource-group $resourceGroup `
  --nsg-name $nsgName `
  --name "Deny-HTTPS-Out" `
  --priority 201 `
  --direction Outbound `
  --access Deny `
  --protocol Tcp `
  --destination-port-ranges 443 `
  --destination-address-prefixes 0.0.0.0/0 `
  --source-address-prefixes "*" `
  --source-port-ranges "*" `
  --description "Block outbound HTTPS to Internet"


