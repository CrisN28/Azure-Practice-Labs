
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "05-VM-Windows-Restored.bicep" `
  -TemplateParameterFile "06-Windows-Restored.json"