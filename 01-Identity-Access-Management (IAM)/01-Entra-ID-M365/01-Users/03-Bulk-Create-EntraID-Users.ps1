# Import users from CSV and create them in Microsoft Entra ID
# Requires Microsoft Graph PowerShell module
# Connect to Graph first: Connect-MgGraph -Scopes "User.ReadWrite.All"

$users = Import-Csv -Path "02-users.csv"

foreach ($user in $users) {
    Write-Host "Creating user:" $user.DisplayName -ForegroundColor Cyan

    New-MgUser `
        -DisplayName $user.DisplayName `
        -UserPrincipalName $user.UserPrincipalName `
        -AccountEnabled:$true `
        -PasswordProfile @{ForceChangePasswordNextSignIn = $true; Password = $user.Password} `
        -MailNickname $user.MailNickname

    Write-Host "User $($user.DisplayName) created successfully!" -ForegroundColor Green
}

Write-Host "All users created." -ForegroundColor Yellow
