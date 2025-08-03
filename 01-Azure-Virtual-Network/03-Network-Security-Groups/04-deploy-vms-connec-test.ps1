# Deployment of the 2 VMs to use Network Watcher features (IP flow verify between two subnets)
# The first VM will be in the destination subnet "Subnet01"
# The second VM will be in the source subnet "SubnetA"

New-AzResourceGroupDeployment `
  -ResourceGroupName RG-Labs-AZ104 `
  -TemplateFile "03-deploy-vms-test.json"


-------------------------------------------------------------------------IP flow verify-------------------------------------------------------------------------------------------------------

# Get the VMs
$sourceVM = Get-AzVM -Name "VM-SubnetA" -ResourceGroupName "RG-Labs-AZ104"
$destinationVM = Get-AzVM -Name "VM-Subnet01" -ResourceGroupName "RG-Labs-AZ104"

# Get the private IP address of the NIC from VM-SubnetA, source of the connection
$sourceIP = (Get-AzNetworkInterface -ResourceGroupName "RG-Labs-AZ104" -Name ($sourceVM.NetworkProfile.NetworkInterfaces[0].Id.Split('/')[-1])).IpConfigurations[0].PrivateIpAddress

# Get the private IP address of the NIC from VM-Subnet01, destination of the connection
$destinationIP = (Get-AzNetworkInterface -ResourceGroupName "RG-Labs-AZ104" -Name ($destinationVM.NetworkProfile.NetworkInterfaces[0].Id.Split('/')[-1])).IpConfigurations[0].PrivateIpAddress


Test-AzNetworkWatcherIPFlow `
  -NetworkWatcherName "NetworkWatcher_eastus" `
  -ResourceGroupName "NetworkWatcherRG" `
  -TargetVirtualMachineId $destinationVM.Id `
  -Direction Inbound `
  -Protocol TCP `
  -LocalPort 22 `
  -RemotePort * `
  -RemoteIPAddress $sourceIP `
  -LocalIPAddress $destinationIP
