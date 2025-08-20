
# Get the Id of an Azure User
Get-AzADUser -DisplayName "Ana Torres" | Select-Object -ExpandProperty Id

# Maria's ID
New-AzRoleAssignment -ObjectId "<Your-Subscription-ID>" -RoleDefinitionName "Reader" -ResourceGroupName "RG-Labs-AZ104"
