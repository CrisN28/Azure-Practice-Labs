// ====================================================
// Bicep template to deploy a restored Windows VM
// using an existing managed disk as OS disk
// ====================================================

// Parameters
param rgName string
param location string
param vmName string
param subnetName string
param vnetName string
param nsgName string
param diskName string

// ====================================================
// References to existing resources in the target resource group (rgName)
// ====================================================
resource vnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  scope: resourceGroup(rgName)
  name: vnetName
}

// Network Security Group
resource nsg 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-RDP'
        properties: {
          priority: 1000
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          direction: 'Inbound'
        }
      }
    ]
  }
}

// Subnet as an existing child of the vnet resource
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' existing = {
  parent: vnet
  name: subnetName
}

// Disk existing (snapshot -> created disk) in the same resource group
resource restoredDisk 'Microsoft.Compute/disks@2022-07-02' existing = {
  scope: resourceGroup(rgName)
  name: diskName
}

// ====================================================
// Network Interface (uses existing subnet and new NSG)
// No Public IP attached
// ====================================================
resource nic 'Microsoft.Network/networkInterfaces@2022-09-01' = {
  name: '${vmName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnet.id
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: null
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

// ====================================================
// Virtual Machine using the existing managed disk as OS disk
// ====================================================
resource vm 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    storageProfile: {
      osDisk: {
        createOption: 'Attach'
        managedDisk: {
          id: restoredDisk.id
        }
        name: diskName
        osType: 'Windows'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
          properties: {
            primary: true
          }
        }
      ]
    }
  }
  tags: {
    purpose: 'Restored-VM'
  }
}
