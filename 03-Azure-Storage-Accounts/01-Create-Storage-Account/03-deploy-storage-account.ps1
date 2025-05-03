# Create a resource group
New-AzResourceGroup -Name "RG-Labs-AZ104" -Location "EastUS"

# Variables
$templateFile = "01-storage-account-template.json"
$parametersFile = "02-storage-account-parameters.json"

# Deploy an ARM template to create a storage account
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parametersFile
