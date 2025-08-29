<#
.DESCRIPTION
    Create a Managed Disk from an existing snapshot.
    This script creates a new Managed Disk using a snapshot as the source.
    The disk can later be used to create a new VM.
#>

# Variables
$rgName = "RG-Labs-AZ104"                  # Resource Group where snapshot exists
$snapshotName = "snap-vmwindows-before-break"  # Name of the snapshot
$newDiskName = "Disk-Restored-VM-Windows"     # Name for the new managed disk
$location = "EastUS"                        # Same location as snapshot

# Get the snapshot
$snapshot = Get-AzSnapshot -ResourceGroupName $rgName -SnapshotName $snapshotName

# Create disk configuration using the snapshot
$diskConfig = New-AzDiskConfig -Location $location -SourceResourceId $snapshot.Id -CreateOption Copy

# Create the new managed disk
New-AzDisk -ResourceGroupName $rgName -DiskName $newDiskName -Disk $diskConfig
