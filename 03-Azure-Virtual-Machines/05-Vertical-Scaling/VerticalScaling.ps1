# ==========================================
# Azure VM Vertical Scaling Script
# ==========================================
# This script stops a VM, resizes it to a larger VM size, and restarts it.
# ==========================================

# Login to Azure (interactive)
Connect-AzAccount

# Variables
$ResourceGroupName = "RG-Labs-AZ104"       # The resource group of your VM
$VMName = "vm-lab01-Wsrv"                       # Name of your VM
$NewVMSize = "Standard_B4ms"             # New size for vertical scaling


# Step 1: Stop the VM
Stop-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Force

# Step 2: Get the VM object
$vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName

# Step 3: Resize the VM
$vm.HardwareProfile.VmSize = $NewVMSize

# Step 4: Update the VM with the new size
Update-AzVM -ResourceGroupName $ResourceGroupName -VM $vm

# Step 5: Start the VM
Start-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName

# Step 6: Verify the new VM size
$vmUpdated = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName
Write-Output "The VM has been resized to: $($vmUpdated.HardwareProfile.VmSize)"
