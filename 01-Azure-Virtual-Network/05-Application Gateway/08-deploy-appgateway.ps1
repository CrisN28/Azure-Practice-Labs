
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "05-appgateway-template.json" `
  -TemplateParameterFile "06-appgateway-parameters.json"

curl http://localhost/clients

