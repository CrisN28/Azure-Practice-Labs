# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.Read.All", "Directory.Read.All"

# Get the P2 license info
$sku = Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq "AAD_PREMIUM_P2" }

# Prepare the report
$report = [PSCustomObject]@{
    SkuId          = $sku.SkuId
    SkuPartNumber  = $sku.SkuPartNumber
    TotalUnits     = $sku.PrepaidUnits.Enabled
    AssignedUnits  = $sku.ConsumedUnits
    AvailableUnits = $sku.PrepaidUnits.Enabled - $sku.ConsumedUnits
}

# Output to console
Write-Host "License Report for P2:"
$report | Format-Table -AutoSize

# Export to CSV
$csvPath = ".\P2_License_Report.csv"
$report | Export-Csv -Path $csvPath -NoTypeInformation

Write-Host "`nCSV report saved to $csvPath"
