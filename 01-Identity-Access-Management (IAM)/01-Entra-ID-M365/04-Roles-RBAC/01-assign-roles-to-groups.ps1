
# Connect to Azure
Connect-AzAccount

# Get the Id of an Azure AD group
Get-AzADGroup -DisplayName "IT" | Select-Object -ExpandProperty Id
Get-AzADGroup -DisplayName "Support" | Select-Object -ExpandProperty Id
Get-AzADGroup -DisplayName "HR" | Select-Object -ExpandProperty Id

# Assign role "Contributor" to the IT group
New-AzRoleAssignment -ObjectId (Get-AzADGroup -DisplayName "IT").Id `
    -RoleDefinitionName "Contributor" `
    -Scope "/subscriptions/<Your-Subscription-ID>/resourceGroups/RG-Labs-AZ104"

# Assign role "Reader" to the Support group
New-AzRoleAssignment -ObjectId (Get-AzADGroup -DisplayName "Support").Id `
    -RoleDefinitionName "Reader" `
    -Scope "/subscriptions/<Your-Subscription-ID>/resourceGroups/RG-Labs-AZ104"

# Assign role "Reader" to the HR group
New-AzRoleAssignment -ObjectId (Get-AzADGroup -DisplayName "HR").Id `
    -RoleDefinitionName "Reader" `
    -Scope "/subscriptions/<Your-Subscription-ID>"
