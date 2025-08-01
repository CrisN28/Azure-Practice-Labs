New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "01-block-subneta-traffic-arm.json"

check NSG rule

Get-AzNetworkSecurityGroup -ResourceGroupName "RG-Labs-AZ104" -Name "NSG-Subnet01-BlockSubnetA" | Get-AzNetworkSecurityRuleConfig


NSG attached subred

Get-AzVirtualNetworkSubnetConfig -Name "Subnet01" -VirtualNetwork (Get-AzVirtualNetwork -Name "Labs-Network" -ResourceGroupName "RG-Labs-AZ104") | Select-Object Name, NetworkSecurityGroup


