# This script blocks outbound HTTP (port 80) and HTTPS (port 443) connections 
# to the Internet from a specific subnet by applying rules to a NSG.

# Variables
$nsgName = "nsg-subnet02"
$resourceGroup = "RG-Labs-AZ104"
$location = "EastUS"

# Create rule to deny HTTP (port 80)
az network nsg rule create `
  --resource-group $resourceGroup `
  --nsg-name $nsgName `
  --name "Deny-HTTP-Out" `
  --priority 200 `
  --direction Outbound `
  --access Deny `
  --protocol Tcp `
  --destination-port-ranges 80 `
  --destination-address-prefixes 0.0.0.0/0 `
  --source-address-prefixes "*" `
  --source-port-ranges "*" `
  --description "Block outbound HTTP to Internet"

# Create rule to deny HTTPS (port 443)
az network nsg rule create `
  --resource-group $resourceGroup `
  --nsg-name $nsgName `
  --name "Deny-HTTPS-Out" `
  --priority 201 `
  --direction Outbound `
  --access Deny `
  --protocol Tcp `
  --destination-port-ranges 443 `
  --destination-address-prefixes 0.0.0.0/0 `
  --source-address-prefixes "*" `
  --source-port-ranges "*" `
  --description "Block outbound HTTPS to Internet"
