
Connect-MgGraph -Scopes "Group.ReadWrite.All", "User.Read.All" 

#create a new users group
New-MgGroup `
        -DisplayName "Lab-MFA-Users" `
        -MailEnabled:$false `
        -MailNickname "LabMFAUsers" `
        -SecurityEnabled:$true


# Get the User ID
Get-MgUser -Filter "userPrincipalName eq 'pedro@domain.onmicrosoft.com'" | Select-Object Id, DisplayName
Get-MgUser -Filter "userPrincipalName eq 'Karen@domain.onmicrosoft.com'" | Select-Object Id, DisplayName

# Get the Group ID
Get-MgGroup -Filter "DisplayName eq 'Lab-MFA-Users'" | Select-Object Id


$groupId = "id"
$pedroId = "id"
$karenId = "id"

# add Pedro
New-MgGroupMemberByRef -GroupId $groupId -BodyParameter @{
    "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$pedroId"
}

# Add Karen
New-MgGroupMemberByRef -GroupId $groupId -BodyParameter @{
    "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$karenId"
}
