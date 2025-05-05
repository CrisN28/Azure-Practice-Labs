# ================================================== Generate SAS Token =================================================== #

# Variables
$containerName = "imageslab"
$resourceGroupName = "RG-Labs-AZ104"
$storageAccountName = "storagelabs2025"


# Retrieve storage account access key
$key = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName)[0].Value


# Create storage context using the retrieved key
$context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $key


# Define SAS token validity period (effective immediately, expires in 1 hour)
$startTime = Get-Date
$expiryTime = $startTime.AddHours(1)


# Generate SAS token for the container with read/write permissions
# This context (admin-level authentication) is required to generate the SAS token.
# It uses the storage account key for full access to the container's permissions.
$containerSASToken = New-AzStorageContainerSASToken `
  -Name $containerName `
  -Context $context `
  -Permission "rw" `
  -StartTime $startTime `
  -ExpiryTime $expiryTime

# Output the SAS token
Write-Output $containerSASToken

# r = read, w = write

# ===================================== Upload File to Container with SAS Token =========================================== #

# Define local file parameters
$filePath = "blob-image/image01.png"    # Path to the local file
$blobName = "image1.png"                # Destination name for the blob in the container


# # This SAS-based context is used instead of full storage credentials
# It grants temporary permissions to write files without exposing the storage account key
$storageContextWithSas = New-AzStorageContext `
  -SasToken $containerSASToken `
  -StorageAccountName $storageAccountName

# Upload file to Azure Blob Storage
Set-AzStorageBlobContent `
  -File $filePath `
  -Container $containerName `
  -Blob $blobName `
  -Context $storageContextWithSas

# ========================================== View File in Browser with SAS Token ========================================== #

# Construct the full URL for accessing the blob using the SAS token
# https://<StorageAccountName>.blob.core.windows.net/<ContainerName>/<BlobName>?<SASToken>
