# ----------------------------------------------------- Deploy Resources with ARM Template ----------------------------------------------------- #

# Define the resource group name
$resourceGroup = "RG-Labs-AZ104"

# Define the Azure region where resources will be deployed
$location = "EastUS"

# Define the ARM template file that will deploy the resources
$templateFile = "04-ip-nsg-rdp-associate-template.json"  

# Define the parameters that will be passed to the ARM template
$ipName = "ip-lab01"
$nsgName = "nsg-lab01"

# Deploy the ARM template to the specified resource group using the parameters defined above
New-AzResourceGroupDeployment `
  -ResourceGroupName $resourceGroup `
  -TemplateFile $templateFile `
  -TemplateParameterObject @{ ipName = $ipName; nsgName = $nsgName; location = $location }


# -------------------------------------------------------Retrieve and Associate Resources-------------------------------------------------------#

# Retrieve the NIC
$nic = Get-AzNetworkInterface -Name "vm-lab01-Wsrv-nic" -ResourceGroupName $resourceGroup

# Fetch the public IP and NSG resources
$publicIP = Get-AzPublicIpAddress -Name $ipName -ResourceGroupName $resourceGroup
$nsg = Get-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $resourceGroup

# Link the public IP and NSG to the NIC
$nic.IpConfigurations[0].PublicIpAddress = $publicIP
$nic.NetworkSecurityGroup = $nsg

# Save and implement changes
Set-AzNetworkInterface -NetworkInterface $nic

