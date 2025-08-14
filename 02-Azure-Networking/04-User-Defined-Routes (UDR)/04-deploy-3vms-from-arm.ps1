# This script deploys three virtual machines in the subnets: "subnet01", "subnet02", and "nva-subnet".

# Define the ARM template file that contains the resource definitions (JSON format)
$templateFile = "02-arm-template-3vms-subnets.json"

# Define the parameter file that contains the values used by the template
$parametersFile = "03-arm-parameters-3vms.json"

# Deploy the resources defined in the ARM template to the specified resource group
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parametersFile
