
# Variables
$rg = "RG-Labs-AZ104"
$templateFile = "04-vms-test-privatedns-template.json"
$parameterFile = "05-vms-test-privatedns-parameters.json"

New-AzResourceGroupDeployment -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile
