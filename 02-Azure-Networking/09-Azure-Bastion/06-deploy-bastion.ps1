

New-AzResourceGroupDeployment -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "04-bastion-with-subnet-template.json" `
  -TemplateParameterFile "05-bastion-with-subnet-parameters.json"