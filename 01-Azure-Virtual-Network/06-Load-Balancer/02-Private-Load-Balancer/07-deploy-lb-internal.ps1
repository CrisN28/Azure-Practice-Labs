
New-AzResourceGroupDeployment `
  -Name "internal-load-balancer-deployment" `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "05-internal-lb-template.json" `
  -TemplateParameterFile "06-internal-lb-params.json"