<#
.SYNOPSIS
    Prepare the Windows Server VM for snapshot/backup demonstration.

.DESCRIPTION
    This script performs the initial setup for the backup lab:
    1. Creates a test file in C:\Users\Public\Documents to demonstrate restoration.
    2. Installs IIS (Internet Information Services) if it is not already installed.
    3. Provides messages to confirm each step.

# ----------------------------------------------------------
# Variables
# ----------------------------------------------------------
$testFilePath = "C:\Users\adminazure\Desktop\Before-Snapshot.txt"  # Test file path

# ----------------------------------------------------------
# Step 1: Create a test file in Notepad
# ----------------------------------------------------------
# Add text to the file to demonstrate restoration after backup/snapshot
"Test file created before snapshot. This file will be used to verify restoration."


# ----------------------------------------------------------
# Step 2: Install IIS (Web Server) if not installed
# ----------------------------------------------------------
# Install IIS CMD
# Install-WindowsFeature -Name Web-Server -IncludeManagementTools
#
# Check if IIS is installed
$webFeature = Get-WindowsFeature -Name Web-Server

if ($webFeature.Installed -eq $false) {
    Install-WindowsFeature -Name Web-Server -IncludeManagementTools
    Write-Host "IIS installed successfully"
} else {
    Write-Host "IIS is already installed"
}
