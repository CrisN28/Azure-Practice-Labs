
# Virtual Machines Frontend Deployment
New-AzResourceGroupDeployment `
  -Name "Frontend-VMs" `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "01-frontend-vms-deployment-template.json" `
  -TemplateParameterFile "02-frontend-vms-params.json"

