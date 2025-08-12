
# Virtual Machines Backend Deployment
New-AzResourceGroupDeployment `
  -Name "Backend-VMs" `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "01-backend-vms-template.json" `
  -TemplateParameterFile "02-backend-vms-params.json"