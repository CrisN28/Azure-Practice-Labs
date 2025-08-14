$resourceGroup = "RG-Labs-AZ104"
$templateFile = "05-vm-linux-test-template.json"
$parameterFile = "06-vm-linux-test-parameters.json"

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroup `
    -TemplateFile $templateFile `
    -TemplateParameterFile $parameterFile
