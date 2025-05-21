# ======================================================================================= #
#                         Query the disks of a Linux virtual machine                        
# ======================================================================================= #

# Resource group name
$resourceGroup = "RG-Labs-AZ104"

# Virtual machine name
$vmName = "vm-linux02"

# Get the virtual machine object
Get-AzVM -Name $vmName -ResourceGroupName $resourceGroup

# Get the OS disk name
(Get-AzVM -Name $vmName -ResourceGroupName $resourceGroup).StorageProfile.OsDisk.Name

# Get the data disk(s) name(s)
(Get-AzVM -Name $vmName -ResourceGroupName $resourceGroup).StorageProfile.DataDisks.Name
