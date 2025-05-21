# Exercise 01 - Deploying a Linux VM using ARM Templates

## Objectives - Exercise 01:

- Understand how to use ARM (Azure Resource Manager) templates to automate resource deployment in Azure
- Deploy a Linux virtual machine using `.json` files that define the infrastructure and configuration parameters
- Apply best practices by separating the template `template` from the configuration parameters `params`
- Execute the deployment using PowerShell with the `New-AzResourceGroupDeployment` cmdlet

<br>

# Exercise 02 - Attach and configure a new disk on a Linux VM

## Objectives - Exercise 02 :

- Learn how to create and configure an additional managed disk in Azure using PowerShell
- Attach the disk to an existing Linux virtual machine
- Validate that the disk was successfully attached using PowerShell queries
- Understand the steps required inside the VM to prepare the new disk (partition, format, and mount it)

<br>

## Learning Outcomes :

- Understand how to deploy a Linux virtual machine in Azure using ARM templates (template + parameters)                               
- Use PowerShell to automate Azure resource deployments                                                                        
- Create and configure an additional managed data disk in Azure                                                       
- Attach a new disk to an existing virtual machine using PowerShell                                            
- Validate that the disk was correctly attached to the virtual machine using PowerShell queries                             
- Identify the necessary steps inside the virtual machine to prepare a new disk                                                

<br>

## Templates and Scripts Used :

1- [ARM template for the Linux VM](./01-deploy-linux-vm-template.json)                                                                         
2- [Parameter file for the VM template](./02-deploy-linux-vm-params.json)                                                                                  
3- [PowerShell script to deploy the VM using ARM template](./03-deployment-vm-linux.ps1)                                                                 
4- [PowerShell script to create and attach a managed disk](./04-create-and-attach-disk.ps1)                                                                
5- [PowerShell script to query VM disks](./05-vm-linux-disk-query.ps1)                                                                             

<br>

## Azure Portal Views and PowerShell Execution Results :

[VM deployment using PowerShell](06-linux-vm-deployment-assets/01-deploy-vm-powershell.png)                               
[VM details in Azure portal](06-linux-vm-deployment-assets/02-vm-portal.png)                                                                 
[Successful deployment in the resource group](06-linux-vm-deployment-assets/03-deployment-rg.png)                                      
[NIC associated with VM and SSH rule (NSG)](06-linux-vm-deployment-assets/04-nic-ssh-rule-vm-subnet.png)                                        
[Script execution to create and attach managed disk](06-linux-vm-deployment-assets/05-second-disk-script.png)                             
[Managed disk attached to VM (portal view)](06-linux-vm-deployment-assets/06-second-disk.png)                                                        
[PowerShell queries to verify VM disks](06-linux-vm-deployment-assets/07-query-vm-disk.png)                                                  

## Visual Diagram : 

in progress

<br>

## Additional Notes:

>[!NOTE]
>- This exercise assumes the following already exist:                                                                                                   
    - The resource group `RG-Labs-AZ104`                                                                                                
    - The virtual network `Labs-Network02`                                                                                                 
    - The subnet `SubnetA`                                                                                                                            

>[!TIP]
>- This exercise also works in other Azure regions, but VM sizes or image names might vary.                                                                  
> If the disk is attached to a running VM, you may need to restart the VM for the operating system to correctly detect the new disk.

>[!IMPORTANT]
>- For improved security, disable password authentication and use SSH keys only.
>- Consider using Azure Bastion, which is much more secure than exposing the SSH port directly.

>[!WARNING]
>- The **Allow-SSH** NSG rule currently allows SSH connections from **any IP address**.
>- This is not recommended in production environments, as it exposes port 22 to the entire internet.
>- Instead, limit access to your own IP or a trusted IP range.


## Project Status :

![Project Status](https://img.shields.io/badge/status-in%20progress-yellow)

> This project is a work in progress. Updates will be made regularly.
