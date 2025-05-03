# Variables
$containerName = "Images"
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
$containerSAS = New-AzStorageContainerSASToken `
  -Name $containerName `
  -Context $context `
  -Permission "rw" `
  -StartTime $startTime `
  -ExpiryTime $expiryTime `
  -FullUri

# Output the complete SAS URL
Write-Output "SAS URL: $containerSAS"

# rw = Read and Write access
# FullUri  # Returns the full SAS URL for direct use

# -------------------------------------------------------------------------------------------------------------------------#


# Variables
$containerSASUrl = $containerSAS  # Full SAS URL generated for access
$filePath = "file.png"  # Local file path of the file to be uploaded
$blobName = "newfile.png"  # Name that the file will have once uploaded as a blob


# Upload the file to the container using the SAS URL
Set-AzStorageBlobContent -File $filePath ` 
-Container "images" `
-Blob $blobName `
-SasToken $containerSASUrl

