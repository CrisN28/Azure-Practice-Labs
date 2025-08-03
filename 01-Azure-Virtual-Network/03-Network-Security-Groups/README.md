# Exercise 01 - Block inbound traffic from one subnet to another

## Scenario:

`You have two virtual networks connected via VNet Peering:`                                                                                                 

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

`You have a virtual network (Labs-Network) with a subnet called Subnet02`                                                                              

`The goal is to allow SSH access (port 22) to virtual machine in that subnet only from`                                                      
`your personal public IP, and block any other connection attempts from different IPs`                                                                    

## Objectives:

- Configure a Network Security Group (NSG) to allow SSH access only from an authorized public IP                                           
- Associate the NSG to the appropriate subnet (Subnet02 - "10.0.2.0/24")                                                            
- Verify that only the allowed IP can connect via SSH                                                                          

<br>

# Exercise 03 - Block outbound HTTP and HTTPS traffic to the Internet from a subnet

## Scenario:

`You have a subnet named Subnet02 in a virtual network`                                                             

`The goal is to prevent virtual machines in that subnet from accessing websites or external resources`                                                        
`using HTTP or HTTPS — in other words, block outbound access to ports 80 and 443 to the Internet`                                                     

## Objectives:

- Configure NSG rules to block outbound traffic from a subnet `(subnet02)` to the Internet
- Specifically, block access to ports 80 (HTTP) and 443 (HTTPS)
- Verify that virtual machines cannot browse the Internet

<br>

## Learning Outcomes:

- How to create and apply NSG (Network Security Group) rules to control both inbound and outbound traffic at the subnet level.
- How to restrict access to services exposed through ports, allowing only connections from authorized public IP addresses.
- How to block outbound web traffic (HTTP/HTTPS) from a subnet to increase security.
- How to use Network Watcher tools (like “IP flow verify” and “effective routes”) to diagnose connectivity issues and validate traffic paths.
- How to secure communication between subnets, even when virtual network peering is enabled.
- How to automate resource deployment using ARM templates and PowerShell, including the creation of virtual machines, subnets, and NSGs with specific rules.
- The importance of testing configurations from within deployed VMs, using commands like curl, to validate the effect of security rules in real-world scenarios.
- Finally, how to combine NSG theory with practical tools in the Azure ecosystem to build a more secure and well-segmented virtual network environment

<br>

## Scripts Used:


## Portal Screenshots and Outputs:

<br>

## Additional notes:

## Project Status :

![Project Status](https://img.shields.io/badge/status-in%20progress-yellow)

> This project is a work in progress. Updates will be made regularly.