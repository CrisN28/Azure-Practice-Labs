# Import CSV with users and licenses
$licenseAssignments = Import-Csv -Path ".\01-licenses.csv"

foreach ($assignment in $licenseAssignments) {

    # Get user object by UPN
    $user = Get-MgUser -Filter "userPrincipalName eq '$($assignment.UserPrincipalName)'" | Select-Object -First 1

    if ($user) {
        # Get the SkuId for the license you want to assign
        $license = Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq $assignment.SkuPartNumber }

        if ($license) {
            # Prepare the license object
            $assignedLicenses = @{
                AddLicenses = @(@{SkuId = $license.SkuId})
                RemoveLicenses = @()
            }

            # Assign the license
            Set-MgUserLicense -UserId $user.Id -BodyParameter $assignedLicenses

            Write-Host "License $($assignment.SkuPartNumber) assigned to $($user.DisplayName)" -ForegroundColor Green
        } else {
            Write-Host "License $($assignment.SkuPartNumber) not found!" -ForegroundColor Red
        }
    } else {
        Write-Host "User $($assignment.UserPrincipalName) not found!" -ForegroundColor Yellow
    }
}

Write-Host "All license assignments completed." -ForegroundColor Cyan

