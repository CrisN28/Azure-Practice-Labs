# Create the resource group
New-AzResourceGroup -Name "RG-Labs-AZ104" -Location "EastUS"


# Variables
$templateFile = "01-vm-deployment-template.json"  # Path to the ARM template file
$parametersFile = "02-parameters-vm.json"         # Path to the parameters file


# Deploy the ARM template
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parametersFile
