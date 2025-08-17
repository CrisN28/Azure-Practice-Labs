# Connect to Microsoft Graph
Connect-MgGraph -Scopes User.ReadWrite.All

# User to remove P2 license from
$userUpn = "ana@pruebajgo2025hotmail.onmicrosoft.com"

# Get the P2 SKU
$sku = Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq "AAD_PREMIUM_P2" }

if ($sku) {
    # Remove P2 license
    Write-Host "Removing P2 license from $userUpn"
    Set-MgUserLicense -UserId $userUpn -RemoveLicenses @($sku.SkuId) -AddLicenses @()
} else {
    Write-Host "P2 SKU not found."
}


# ------------------------------------------------------Verify User License------------------------------------------------------


# Connect to Microsoft Graph
Connect-MgGraph -Scopes User.Read.All

# User to check
$userUpn = "ana@pruebajgo2025hotmail.onmicrosoft.com"

# Get user
$user = Get-MgUser -UserId $userUpn

Write-Host "`nUser: $($user.DisplayName) <$userUpn>"

if ($user.AssignedLicenses.Count -eq 0) {
    Write-Host "No licenses assigned."
} else {
    foreach ($license in $user.AssignedLicenses) {
        $licenseDetails = Get-MgSubscribedSku | Where-Object { $_.SkuId -eq $license.SkuId }
        Write-Host "License still assigned: $($licenseDetails.SkuPartNumber)"
        
        foreach ($plan in $license.ServicePlans) {
            $status = if ($plan.ProvisioningStatus -eq "Enabled") { "Enabled" } else { "Disabled" }
            Write-Host "  - Service Plan: $($plan.ServicePlanName) Status: $status"
        }
    }
}
