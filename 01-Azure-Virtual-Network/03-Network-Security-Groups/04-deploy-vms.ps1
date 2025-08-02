New-AzResourceGroupDeployment `
  -ResourceGroupName RG-Labs-AZ104 `
  -TemplateFile "03-deploy-vms-test.json"


$sourceVM = Get-AzVM -Name "VM-SubnetA" -ResourceGroupName "RG-Labs-AZ104"
$destinationVM = Get-AzVM -Name "VM-Subnet01" -ResourceGroupName "RG-Labs-AZ104"

# Obtener IP privada de la NIC de VM-SubnetA
$sourceVM = (Get-AzNetworkInterface -ResourceGroupName "RG-Labs-AZ104" -Name ($vmOrigen.NetworkProfile.NetworkInterfaces[0].Id.Split('/')[-1])).IpConfigurations[0].PrivateIpAddress

# Obtener IP privada de la NIC de VM-Subnet01
$destinationVM = (Get-AzNetworkInterface -ResourceGroupName "RG-Labs-AZ104" -Name ($vmDestino.NetworkProfile.NetworkInterfaces[0].Id.Split('/')[-1])).IpConfigurations[0].PrivateIpAddress


Test-AzNetworkWatcherIPFlow `
  -NetworkWatcherName "NetworkWatcher_eastus" `
  -ResourceGroupName "NetworkWatcherRG" `
  -TargetVirtualMachineId $vmDestino.Id `
  -Direction Inbound `
  -Protocol TCP `
  -LocalPort 22 `
  -RemotePort * `
  -RemoteIPAddress $ipOrigen `
  -LocalIPAddress $ipDestino
