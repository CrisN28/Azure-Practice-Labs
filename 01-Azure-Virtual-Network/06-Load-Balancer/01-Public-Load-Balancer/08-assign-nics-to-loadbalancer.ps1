# Get the Load Balancer
$lb = Get-AzLoadBalancer -Name "public-lb" -ResourceGroupName "RG-Labs-AZ104"

# Get the Backend Address Pool
$backendPool = $lb.BackendAddressPools | Where-Object { $_.Name -eq "LoadBalancerBackEndPool" }

# Update NIC 1
$nic1 = Get-AzNetworkInterface -Name "nic-frontend-1" -ResourceGroupName "RG-Labs-AZ104"
$nic1.IpConfigurations[0].LoadBalancerBackendAddressPools = @($backendPool)
Set-AzNetworkInterface -NetworkInterface $nic1

# Update NIC 2
$nic2 = Get-AzNetworkInterface -Name "nic-frontend-2" -ResourceGroupName "RG-Labs-AZ104"
$nic2.IpConfigurations[0].LoadBalancerBackendAddressPools = @($backendPool)
Set-AzNetworkInterface -NetworkInterface $nic2
