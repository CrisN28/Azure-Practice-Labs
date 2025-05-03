New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "04-storage-container-template.json" `
  -TemplateParameterFile "05-storage-container-parameters.json"
