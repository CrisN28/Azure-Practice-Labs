
# Variables
$rg = "RG-Labs-AZ104"
$templateFile = "01-deploy-vm-subneta-template.json"
$parameterFile = "02-deploy-vm-subneta-parameters.json"


New-AzResourceGroupDeployment -ResourceGroupName $rg `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile

