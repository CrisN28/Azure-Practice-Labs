# Private Blob Container Deployment in Azure  

This exercise explains best practices for **secure storage management in Azure**, focusing on creating a private blob container using an ARM template,         
Additionally, the exercise includes:  

- **Generating a SAS token** to enable controlled access to the private container
- **Uploading a blob (image) using the SAS token**, demonstrating secure data transfer in Azure Storage                                           

<br>

# Exercise 01 - Create a private blob container using ARM

## Objectives - Exercise 01:

- Deploy a **private blob container** in Azure using an ARM template with restricted access   
- Automate deployment using Infrastructure-as-Code principles with ARM templates  
- Configure restricted access to ensure security

<br>

# Exercise 02 - Generate a SAS Token and Upload an Image 

## Objectives - Exercise 02:

- Generate a **SAS token** to allow controlled access to a private container  
- Securely upload an **image** (blob) to the storage account using SAS authentication    
- Apply security and access control best practices in Azure Storage   


## Learning Outcomes:

- Understand the fundamentals of deploying a private blob container using ARM templates          
- Learn how to generate and utilize a **SAS token** for controlled access to private storage    
- Execute secure data transfers by uploading a **blob (image) using SAS authentication**     
- Learn how to effectively configure **Azure Storage access policies** to safeguard critical data and resources  

<br>

## Templates and Scripts Used:

1 - [ARM Template for Private Container](./04-storage-container-template.json)                                
2 - [Parameters Template for Private Container Deployment](./05-storage-container-parameters.json)                
3 - [PowerShell Script to Deploy Private Container](./06-deploy-storage-container.ps1)                            
4 - [PowerShell Script to Generate SAS Token and Upload an Image](./07-sas-token-upload-blob.ps1)                      

<br>

## Visual references:

- [Private Blob Container Details](./blob-container-views/01-private-container-details.png)
- [Azure Portal View of Private Container](./blob-container-views/02-container-portal-view.png)
- [Blob Upload Details](./blob-container-views/03-blob-upload-details.png)
- [Azure Portal View of Uploaded Blob](./blob-container-views/04-uploaded-blob-portal-view.png)
- [Uploaded Blob File (Image)](./blob-container-views/image01.png)


## Visual Diagram:

- [Azure Blob Container Deployment and SAS Authentication (PDF)](./secure-container-architecture/sas-container-architecture.pdf)

<br>

## Additional notes:

>[!IMPORTANT]
> This exercise was built using a pre-existing [Storage Account](/03-Azure-Storage-Accounts/01-Create-Storage-Account)          

>[!TIP]
> For enhanced security, consider integrating with Azure Key Vault to securely manage and rotate your keys                

>[!CAUTION]
> Never expose storage account keys in production. Use RBAC roles or restricted SAS tokens instead                    

<br>

## Project Status:

![Completed](https://img.shields.io/badge/Status-Completed-brightgreen)
