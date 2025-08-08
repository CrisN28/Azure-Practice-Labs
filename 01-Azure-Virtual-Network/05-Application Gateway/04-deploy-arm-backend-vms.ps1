# Variables
$resourceGroupName = "RG-Labs-AZ104"
$templateFile = "02-arm-backend-vms-template.json"
$parametersFile = "03-arm-backend-vms-parameters.json"
$deploymentName = "backend-vm-deployment"

# Ejecutar el despliegue usando Az PowerShell
New-AzResourceGroupDeployment `
  -Name $deploymentName `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parametersFile
