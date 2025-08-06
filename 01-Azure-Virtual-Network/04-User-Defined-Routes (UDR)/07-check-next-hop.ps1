
# -----------------------------------------------------------Test Next Hop - "vmA" to "vmB"--------------------------------------------------------------------------------------


# Variables
$rg = "RG-Labs-AZ104"
$nwRG = "NetworkWatcherRG"
$nwName = "NetworkWatcher_eastus"
$sourceVmName = "vmA"

# Get the virtual machine object
$sourceVm = Get-AzVM -ResourceGroupName $rg -Name $sourceVmName

# Get the network interface (NIC) attached to the VM ("vmA")
$sourceNic = Get-AzNetworkInterface -ResourceGroupName $rg -Name ($sourceVm.NetworkProfile.NetworkInterfaces[0].Id.Split('/')[-1])

# Get the private IP address of the VM
$sourceIp = $sourceNic.IpConfigurations[0].PrivateIpAddress

# Use any IP from the destination subnet (except vmB's IP address)
$testDestIp = "10.0.2.100"  

# Use Network Watcher to determine the next hop
# from the source VM to the destination IP address
Get-AzNetworkWatcherNextHop `
  -NetworkWatcherName $nwName `
  -ResourceGroupName $nwRG `
  -TargetVirtualMachineId $sourceVm.Id `
  -SourceIpAddress $sourceIp `
  -DestinationIpAddress $testDestIp


# -----------------------------------------------------------Test Next Hop - "vmA" to "vmB"--------------------------------------------------------------------------------------


# Run the following steps on the destination VM (vmB)

# Get the virtual machine object
$sourceVm = Get-AzVM -ResourceGroupName $rg -Name "vmB"

# Get the network interface (NIC) attached to the VM ("vmB")
$sourceNic = Get-AzNetworkInterface -ResourceGroupName $rg -Name ($sourceVm.NetworkProfile.NetworkInterfaces[0].Id.Split('/')[-1])

# Get the private IP address of the VM
$sourceIp = $sourceNic.IpConfigurations[0].PrivateIpAddress

# Use a test destination IP (different from vmA's IP address)
$testDestIp = "10.0.1.100"

# Use the 'Next hop' feature in Azure Network Watcher
Get-AzNetworkWatcherNextHop `
  -NetworkWatcherName $nwName `
  -ResourceGroupName $nwRG `
  -TargetVirtualMachineId $sourceVm.Id `
  -SourceIpAddress $sourceIp `
  -DestinationIpAddress $testDestIp

# End of the first exercise