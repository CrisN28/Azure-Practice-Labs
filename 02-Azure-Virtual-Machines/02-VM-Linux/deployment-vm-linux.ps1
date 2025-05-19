# IMPORTANT:
# The resource group "RG-Labs-AZ104" must already exist
# The virtual network named "Labs-Network02" and the subnet named "SubnetA"
# must already exist in the same region and resource group before running this deployment.

# Define the ARM template file that contains the resource definitions (JSON format)
$templateFile = "01-deploy-linux-vm-template.json"

# Define the parameter file that contains the values used by the template
$parametersFile = "02-deploy-linux-vm-params.json"

# Deploy the resources defined in the ARM template to the specified resource group
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `  
  -TemplateFile $templateFile `         
  -TemplateParameterFile $parametersFile
