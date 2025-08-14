# deployment of the VM in the 'Subnet-UDR' subnet
# Deploy de New VM 
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-Labs-AZ104" `
  -TemplateFile "09-vm-subnetudr-template.json" `
  -TemplateParameterFile "10-vm-subnetudr-parameters.json"
