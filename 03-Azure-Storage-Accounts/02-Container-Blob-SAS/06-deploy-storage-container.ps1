# Deploy an ARM template to create a private blob container in Azure (Images)

New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `  # Name of the resource group where the container will be deployed
  -TemplateFile "04-storage-container-template.json" `  # ARM template defining the storage container configuration
  -TemplateParameterFile "05-storage-container-parameters.json"  # Parameter file specifying storage account and container name
