
$groupNames = @("IT","HR","Finance","Support")

foreach ($groupName in $groupNames) {
    $newGroup = New-MgGroup `
        -DisplayName $groupName `
        -MailEnabled:$false `
        -MailNickname $groupName `
        -SecurityEnabled:$true

    Write-Host "Group $groupName created with Id:" $newGroup.Id}
