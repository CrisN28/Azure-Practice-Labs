# Exercise 01 - Create and Deploy a Virtual Machine

## Objectives - Exercise 01:

- Deploy a virtual machine using the ARM template.
- Create a parameter template to deploy the virtual machine.

<br>

# Exercise 02 - Create a Public IP Address, a Network Security Group, and Associate Them with the Virtual Machine
 
## Objectives - Exercise 02:

- Set up a dynamic public IP address and link it to the virtual machine’s network interface.
- Configure a Network Security Group (NSG) with rules that allow RDP access (port 3389) for the virtual machine.

<br>

## Learning Outcomes:

- Developed expertise in linking public IPs and NSGs to NICs to create secure connections.
- Understood the process of associating public IPs and network security groups (NSGs) with network interfaces (NICs).
- Developed well-organized and efficient scripts for Azure resource management.
- Practiced using commands to audit configurations and validate security rules.


## Templates and Scripts Used:

- [ARM Template for the Virtual Machine](./01-vm-deployment-template.json)
- [Parameters Template for Virtual Machine](./02-parameters-vm.json)
- [PowerShell Scripts to Deploy the Virtual Machine](./03-deploy-vm.ps1)

- [ARM Template for Public IP, NSG, and RDP Rule Association](./04-ip-nsg-rdp-associate-template.json)
- [PowerShell Script to Attach Public IP and NSG to the VM](./05-deploy-associate-ip-nsg.ps1)

- [PowerShell Script to Verify Public IP and NSG Configuration](./06-verifyIP-NSG.ps1)


## Visual references:

[Virtual Machine Deployment (Initial deployment view)](./07-deployment-views/01-VM-deploy.png)

[Virtual Machine View (Details of the VM)](./07-deployment-views/02-Virtual-Machine.png)

[Public IP, NSG, and RDP Rule Deployment (Deploy IP and NSG)](./07-deployment-views/03-ip-nsg-rdp-deploy.png)

[Public IP Address Details](./07-deployment-views/04-Public-IP.png)

[Network Interface Card (NIC) Configuration](./07-deployment-views/05-NIC.png)

[Network Interface Connection Status Verification](./07-deployment-views/06-NIC-verify.png)

[Remote Desktop Protocol Rule (RDP) Rule Verification](./07-deployment-views/07-rdp-rule.png)

[Complete Deployment Resources (All resources view)](./07-deployment-views/08-All-Resources.png)


## Visual Diagram:

[Resource Architecture Overview Diagram (PDF)](./08-architecture-designs/Resource-Architecture.pdf)


## Additional notes:

>[!IMPORTANT]
>- Pre-existing network and subnet: The virtual network (Labs-Network) and the subnet (Subnet01) were set up in a prior exercise and are used in this one.

>[!CAUTION]
>- Security best practices: RDP access rules should never allow universal access in production setups, as this opens the system to critical security threats.


## Project Status:
![Completed](https://img.shields.io/badge/Status-Completed-brightgreen)
