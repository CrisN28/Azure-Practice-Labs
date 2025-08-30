
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "01-vmss-template.json" `
  -TemplateParameterFile "02-vmss-parameters.json"