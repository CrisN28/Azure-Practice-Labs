
# Define the ARM template file that contains the resource definitions (JSON format)
$templateFile = "02-vms-subnets-arm-template.json"

# Define the parameter file that contains the values used by the template
$parametersFile = "03-vms-parameters-file.json"

# Deploy the resources defined in the ARM template to the specified resource group
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parametersFile
  