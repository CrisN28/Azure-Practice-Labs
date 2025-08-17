# Connect to Microsoft Graph
Connect-MgGraph -Scopes User.ReadWrite.All

# Import the CSV
$users = Import-Csv "03-Licenses-Microsoft-365.csv"

foreach ($user in $users) {
    # Find the SKU for the license (e.g., ENTERPRISEPACK for M365 E3)
    $sku = Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq $user.LicenseName.Replace(" ", "") }

    if ($sku) {
        Write-Host "Assigning license $($user.LicenseName) to $($user.UserPrincipalName)"
        
        # Assign the license to the user
        Set-MgUserLicense -UserId $user.UserPrincipalName -AddLicenses @{SkuId=$sku.SkuId} -RemoveLicenses @()
    }
    else {
        Write-Host "❌ License $($user.LicenseName) not found"
    }
}
