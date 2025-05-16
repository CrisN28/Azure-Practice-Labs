# Exercise 01 - Creating a virtual network with two subnets

## Objetives:

- Use an existing resource group for network deployment
- Deploy a virtual network `Labs-Network02` with a /16 address space
- Define subnet configurations with specific address prefixes (SubnetA-SubnetB)

<br>

# Exercise 02 - Creating Virtual Network Peering

## Objetives:

- Retrieve two existing virtual networks using `Get-AzVirtualNetwork`
- Establish peering from `Labs-Network` to `Labs-Network02` to allow traffic between them
- Establish reverse peering from `Labs-Network02` to `Labs-Network`
- Practice using `Add-AzVirtualNetworkPeering` to configure bidirectional communication

<br>

## Learning Outcomes:

- Understand how to reuse an existing resource group for deploying network infrastructure
- Know how to define address spaces and create a virtual network with two subnets using PowerShell
- Implement bidirectional peering between VNets and manage traffic flow
- Learn to retrieve resource properties (such as `.Id`) via `Get-AzVirtualNetwork`
- Identify and prevent IP address range overlaps between networks to ensure proper connectivity

<br>

## Script Used:

1- [Deploy a VNet with two subnets (PowerShell)](./01-VNet-Subnets-Deploy.ps1)  
2- [PowerShell script to set up virtual network peering](./02-VNet-Peering-Setup.ps1)


<br>

## Screenshots and Diagrams:

[](./)

[](./)

<br>

![Project Status](https://img.shields.io/badge/status-in%20progress-yellow)
> This project is a work in progress. Updates will be made regularly