# Deploy an ARM template to create a private blob container in Azure

$templateFile = "04-storage-container-template.json"  # ARM template defining the storage container configuration
$parametersFile = "05-storage-container-parameters.json"  # Parameter file specifying storage account and container name


# Deploy an ARM template to create a private container in the storagelabs2025 storage account
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parametersFile
