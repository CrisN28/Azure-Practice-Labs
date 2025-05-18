# Exercise 01 - Creating a virtual network with two subnets

## Objectives:

- Use an existing resource group for network deployment
- Deploy a virtual network `Labs-Network02` with a /16 address space
- Define subnet configurations with specific address prefixes (SubnetA and SubnetB)

<br>

# Exercise 02 - Creating Virtual Network Peering

## Objectives:

- Retrieve two existing virtual networks using `Get-AzVirtualNetwork`
- Establish peering from `Labs-Network` to `Labs-Network02` to allow traffic between them
- Establish reverse peering from `Labs-Network02` to `Labs-Network`
- Practice using `Add-AzVirtualNetworkPeering` to configure bidirectional communication

<br>

## Learning Outcomes:

- Learn how to reuse an existing resource group for deploying network infrastructure
- Learn how to define address spaces and create a virtual network with two subnets using PowerShell
- Implement bidirectional peering between VNets and manage traffic flow
- Learn to retrieve resource properties (such as `.Id`) via `Get-AzVirtualNetwork`
- Identify and prevent IP address range overlaps between networks to ensure proper connectivity

<br>

## Scripts Used:

1- [Deploy a VNet with two subnets using PowerShell](./01-VNet-Subnets-Deploy.ps1)  
2- [PowerShell script to set up virtual network peering](./02-VNet-Peering-Setup.ps1)


## Portal Screenshots and Outputs:

- [Deploying the Second Virtual Network](vnet-peering-views/01-vnet2-subnets-deploy.png)                                                                    
- [Virtual Networks and Subnets – Azure Portal View](vnet-peering-views/02-vnets-subnets-portal.png)                                                         
- [Virtual Network Peering Configuration Output](vnet-peering-views/03-vnets-peering-output.png)                                                       
- [Peering Verification Command Output](vnet-peering-views/04-peering-validation-cmd.png)                                                                     
- [Peering Status in Azure Portal](vnet-peering-views/05-network-connectivity-portal.png)                                                         


## Network Architecture Diagram:

- [Virtual Network Peering Architecture (PDF)](vnet-peering-views/06-vnet-peering-architecture.pdf)

<br>

## Additional notes:

>[!NOTE]
> Remember to remove the virtual network peering before deleting the VNets to avoid dependency errors.

>[!TIP]
> To monitor and validate connectivity, enable Azure Network Watcher in EastUS and use the Connection Monitor without needing VMs.

>[!IMPORTANT]
> This exercise was built using an existing resource group, virtual network and subnets.                                

>[!CAUTION]
> Do not assign overlapping IP address ranges between VNets; otherwise, peering will fail or connectivity may be inconsistent.


## Project Status:

![Completed](https://img.shields.io/badge/Status-Completed-brightgreen)
