# Variables
$resourceGroup = "RG-Labs-AZ104"
$location = "EastUS"
$vmName = "vm-linux02"
$diskName = "vm-linux02-disk02"
$diskSizeGB = 60

# Create a managed disk of 60 GB (Standard HDD)
$diskConfig = New-AzDiskConfig `
  -Location $location `
  -CreateOption Empty `
  -DiskSizeGB $diskSizeGB `
  -SkuName StandardSSD_LRS

$disk = New-AzDisk `
  -ResourceGroupName $resourceGroup `
  -DiskName $diskName `
  -Disk $diskConfig

# Get the existing virtual machine
$vm = Get-AzVM -Name $vmName -ResourceGroupName $resourceGroup

# Attach the new managed disk to the VM
$vm = Add-AzVMDataDisk `
  -VM $vm `
  -Name $diskName `
  -CreateOption Attach `
  -ManagedDiskId $disk.Id `
  -Lun 1

# Update the virtual machine to apply changes
Update-AzVM -VM $vm -ResourceGroupName $resourceGroup


# ============================================================================ #
# IMPORTANT (steps inside the virtual machine):

# Once connected to the VM (via SSH), the new disk must be prepared:

# 1. Detect the new disk.
# 2. Create a partition.
# 3. Create a file system.
# 4. Create a mount point.
# 5. Mount the disk.
# 6. (Optional) Make the mount permanent by editing the /etc/fstab file.
