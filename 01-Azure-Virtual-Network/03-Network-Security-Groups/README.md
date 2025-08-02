# Exercise 01 - Block inbound traffic from one subnet to another

## Scenario:

You have two virtual networks connected via VNet Peering:                                                                                                 

1- Labs-Network: 10.0.0.0/16:                                                                                                                          
- Subnet01: 10.0.1.0/24                                                                                                                          
- Subnet02: 10.0.2.0/24 

2- Labs-Network02: 10.1.0.0/16:                                                                                                                     
- SubnetA: 10.1.1.0/24                                                                                                                           
- SubnetB: 10.1.2.0/24                                                                                                                      

`The goal is to block all inbound traffic from SubnetA (10.1.1.0/24) to Subnet01 (10.0.1.0/24),`                                                           
`even though both networks are connected using VNet Peering.`                                                                                        


## Objectives:

- Create a Network Security Group (NSG)
- Associate the NSG with a specific subnet
- Create a rule to block inbound traffic from another subnet
- Test the rule using virtual machines and Network Watcher

<br>

# Exercise 02 - Allow inbound SSH traffic only from a specific public IP

## Scenario:

You have a virtual network (Labs-Network) with a subnet called Subnet02.                                                                              

`The goal is to allow SSH access (port 22) to virtual machine in that subnet only from`                                                      
`your personal public IP, and block any other connection attempts from different IPs.`                                                                    

## Objectives:

- Configure a Network Security Group (NSG) to allow SSH access only from an authorized public IP.                                           
- Associate the NSG to the appropriate subnet (Subnet02 - "10.0.2.0/24").                                                            
- Verify that only the allowed IP can connect via SSH.                                                                          

<br>

# Exercise 03 - 

## Objectives:

<br>

## Learning Outcomes:

- 
- 
- 
- 


<br>

## Scripts Used:


## Portal Screenshots and Outputs:

<br>

## Additional notes:

## Project Status :

![Project Status](https://img.shields.io/badge/status-in%20progress-yellow)

> This project is a work in progress. Updates will be made regularly.