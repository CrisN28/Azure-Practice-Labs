# Get the Internal Load Balancer
$lb = Get-AzLoadBalancer -Name "internal-lb" -ResourceGroupName "RG-Labs-AZ104"

# Get the Backend Address Pool
$backendPool = $lb.BackendAddressPools | Where-Object { $_.Name -eq "internal-backendPool" }

# # Update NIC of vm-backend-1
$nic1 = Get-AzNetworkInterface -Name "nic-backend-1" -ResourceGroupName "RG-Labs-AZ104"
$nic1.IpConfigurations[0].LoadBalancerBackendAddressPools = @($backendPool)
Set-AzNetworkInterface -NetworkInterface $nic1

# Update NIC of vm-backend-2
$nic2 = Get-AzNetworkInterface -Name "nic-backend-2" -ResourceGroupName "RG-Labs-AZ104"
$nic2.IpConfigurations[0].LoadBalancerBackendAddressPools = @($backendPool)
Set-AzNetworkInterface -NetworkInterface $nic2
