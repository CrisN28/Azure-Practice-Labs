
# Get the Id of an Azure AD group
Get-AzADGroup -DisplayName "IT" | Select-Object -ExpandProperty Id


# Revoke the "Contributor" role assignment for a group at the resource level
Remove-AzRoleAssignment `
    -ObjectId "0234c79a-5e51-45d5-b6e8-3dde57a9e807" `
    -RoleDefinitionName "Contributor" `
    -ResourceGroupName "RG-Labs-AZ104"

