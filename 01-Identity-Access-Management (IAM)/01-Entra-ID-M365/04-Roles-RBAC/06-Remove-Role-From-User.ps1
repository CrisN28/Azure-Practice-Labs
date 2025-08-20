
# Get the Id of an Azure User
Get-AzADUser -DisplayName "Ana Torres" | Select-Object -ExpandProperty Id

# Revoke the "Reader" role assignment for a specific user at the resource group level
Remove-AzRoleAssignment `
    -ObjectId "9e4e9351-9399-4dd6-b5ab-a0fa79c3a547" `
    -RoleDefinitionName "Reader" `
    -ResourceGroupName "RG-Labs-AZ104"