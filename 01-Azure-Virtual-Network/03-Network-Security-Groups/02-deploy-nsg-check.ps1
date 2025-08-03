# Deploying the Network Security Group (NSG) to the "Subnet01" subnet
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "01-nsg-block-subneta.json"


# check NSG rule
Get-AzNetworkSecurityGroup -ResourceGroupName "RG-Labs-AZ104" -Name "NSG-Subnet01-BlockSubnetA" | Get-AzNetworkSecurityRuleConfig

# check NSG attached subnet
Get-AzVirtualNetworkSubnetConfig -Name "Subnet01" -VirtualNetwork (Get-AzVirtualNetwork -Name "Labs-Network" -ResourceGroupName "RG-Labs-AZ104") | Select-Object Name, NetworkSecurityGroup
