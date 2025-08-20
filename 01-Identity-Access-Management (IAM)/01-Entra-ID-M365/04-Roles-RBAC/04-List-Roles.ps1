
# Store the subscription ID in a variable
$sub = "<Your-Subscription-ID>"


# Get role assignments in the subscription and display:
# - DisplayName: name of the user, group, or service principal
# - RoleDefinitionName: role assigned (e.g., Reader, Contributor, Owner)
# - ObjectType: type of the principal (User, Group, ServicePrincipal, etc.)
# - Scope: level where the role applies (Subscription, Resource Group, or specific Resource)

Get-AzRoleAssignment -Scope "/subscriptions/$sub" | Format-Table DisplayName, RoleDefinitionName, ObjectType, Scope
