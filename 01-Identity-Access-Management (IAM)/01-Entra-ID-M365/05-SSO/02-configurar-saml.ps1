# Load app information from previous step
$info = Get-Content ".\app-info.json" | ConvertFrom-Json

# Configure SSO mode as SAML
Update-MgServicePrincipal -ServicePrincipalId $info.ServicePrincipalId -PreferredSingleSignOnMode "saml"

# Define Identifier (Entity ID) and Reply URL (ACS)
$identifier = "https://mypracticeapp.test"
$replyUrl   = "https://webhook.site/link"

# Apply configuration to the Application
Update-MgApplication -ApplicationId $info.AppId `
    -Web @{ RedirectUris = @($replyUrl) } `
    -IdentifierUris @($identifier)

Write-Host "SAML configured with Identifier and Reply URL at $replyUrl"
