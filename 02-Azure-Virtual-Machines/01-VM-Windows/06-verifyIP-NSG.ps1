# --------------------------------------------------------Verify Settings---------------------------------------------------------------------- #

# Check the public IP linked to the NIC
Get-AzNetworkInterface -Name "vm-lab01-Wsrv-nic" -ResourceGroupName "RG-Labs-AZ104" | Select -ExpandProperty IpConfigurations

# Inspect the NSG rules
Get-AzNetworkSecurityGroup -Name "nsg-lab01" -ResourceGroupName "RG-Labs-AZ104" | Select -ExpandProperty SecurityRules
