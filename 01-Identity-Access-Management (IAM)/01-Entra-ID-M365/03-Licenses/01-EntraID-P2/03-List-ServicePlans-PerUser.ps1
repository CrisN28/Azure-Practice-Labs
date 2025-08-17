# Users to check
$usersList = @(
    "Karen@pruebajgo2025hotmail.onmicrosoft.com",
    "pedro@pruebajgo2025hotmail.onmicrosoft.com",
    "ana@pruebajgo2025hotmail.onmicrosoft.com"
)

foreach ($userUpn in $usersList) {
    Write-Host "`nUser: $userUpn"

    # Get detailed license info per user
    $licenseDetails = Get-MgUserLicenseDetail -UserId $userUpn

    foreach ($license in $licenseDetails) {
        Write-Host "License: $($license.SkuPartNumber)"
        
        foreach ($servicePlan in $license.ServicePlans) {
            $status = if ($servicePlan.ProvisioningStatus -eq "Enabled") { "Enabled" } else { "Disabled" }
            Write-Host "  - Service Plan: $($servicePlan.ServicePlanName) Status: $status"
        }
    }
}