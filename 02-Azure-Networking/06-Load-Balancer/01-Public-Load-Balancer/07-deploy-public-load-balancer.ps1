
# Deployment of Public load Balancer
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "05-public-loadbalancer-template.json" `
  -TemplateParameterFile "06-public-loadbalancer-params.json"