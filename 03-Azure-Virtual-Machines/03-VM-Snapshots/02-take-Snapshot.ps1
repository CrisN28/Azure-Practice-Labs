
# Variables
$rgName = "RG-Labs-AZ104"
$vmName = "vm-lab01-Wsrv"
$location = "EastUS"

# Get the OS disk ID
$osDisk = (Get-AzVM -ResourceGroupName $rgName -Name $vmName).StorageProfile.OsDisk.ManagedDisk.Id

# Create snapshot configuration
$snapshotConfig = New-AzSnapshotConfig -SourceUri $osDisk -Location $location -CreateOption Copy

# Create the snapshot
New-AzSnapshot -Snapshot $snapshotConfig -SnapshotName "snap-vmwindows-before-break" -ResourceGroupName $rgName
