
# Get the User ID
Get-MgUser -Filter "userPrincipalName eq 'user@dominio.com'" | Select-Object Id, DisplayName

# Get the Group ID
Get-MgGroup -Filter "DisplayName eq 'group name'" | Select-Object Id

# Group IDs
$groupFinance = "ee760d1d-4b6b-4816-b13e-09b8fdbbfbc8"
$groupHR      = "5c90c0aa-53c2-4c75-ad93-6f10ca9a50d1"
$groupIT      = "c4ccfc9e-a4c9-4091-921c-46e9fd9b8287"
$groupSupport = "bef8c345-4bb5-47f4-96e9-ed6d6e88c52a"

# Users IDs
$users = @(
    @{Id="02ceb1d1-d17f-446e-b2f8-c5ac1fac5fcc"; Group=$groupIT},      # Karen Martinez -> IT
    @{Id="7da54868-77d5-4cd1-889f-1f95a1cba93c"; Group=$groupHR},      # Pedro Gomez -> HR
    @{Id="9e4e9351-9399-4dd6-b5ab-a0fa79c3a547"; Group=$groupFinance}, # Ana Torres -> Finance
    @{Id="b664c1e7-2448-4d2f-96ad-1167f74caf2d"; Group=$groupSupport}, # Carlos Ramirez -> Support
    @{Id="e893f409-c66b-4157-869f-6eedd59d6a44"; Group=$groupIT},      # Sofia Perez -> IT
    @{Id="85f4e9e1-c676-4fe8-a0ba-a006736f19eb"; Group=$groupHR}       # Laura Martinez -> HR
)

# Assign users to their groups
foreach ($user in $users) {
    $body = @{
        "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$($user.Id)"
    }

    New-MgGroupMemberByRef -GroupId $user.Group -BodyParameter $body
    Write-Host "User with ID $($user.Id) added to group $($user.Group)" -ForegroundColor Green
}

Write-Host "All users have been assigned to their groups." -ForegroundColor Yellow
