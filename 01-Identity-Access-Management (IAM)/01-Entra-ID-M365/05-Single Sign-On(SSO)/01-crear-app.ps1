
# Conectar a Microsoft Graph
Connect-MgGraph -Scopes "Application.ReadWrite.All","Directory.ReadWrite.All" -NoWelcome

# GUID del template de aplicación (Non-gallery)
$applicationTemplateId = "8adf8e6e-67b2-4cf2-a259-e3dc5476c621"

# Crear la aplicación
$app = Invoke-MgInstantiateApplicationTemplate -ApplicationTemplateId $applicationTemplateId -BodyParameter @{ DisplayName = "MyPracticeApp" }

# Esperar unos segundos para que se cree la aplicación
Start-Sleep -Seconds 60

# Obtener la aplicación por DisplayName
$app = Get-MgApplication -Filter "DisplayName eq 'MyPracticeApp'"

# Obtener el Service Principal asociado
$sp = Get-MgServicePrincipal -All | Where-Object { $_.AppId -eq $app.AppId }


# Guardar la información importante en JSON
$info = @{
    AppId              = $app.Id             # ObjectId de la aplicación
    ClientId           = $app.AppId          # AppId / ClientId
    ServicePrincipalId = $sp.Id              # ObjectId del Service Principal
}

$info | ConvertTo-Json | Out-File ".\app-info.json" -Force

Write-Host "Application and SP successfully saved in app-info.json"
