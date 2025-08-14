# Variables
$resourceGroup = "RG-Labs-AZ104"
$templateFile = "02-vpn-gateway-template.json"
$parameterFile = "03-vpn-gateway-parameters.json"

# Deploy the ARM template
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroup `
    -TemplateFile $templateFile `
    -TemplateParameterFile $parameterFile
