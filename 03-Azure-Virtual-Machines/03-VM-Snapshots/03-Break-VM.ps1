
# Scenario: Breaking the Windows Server VM to demonstrate restoration from snapshot

# Steps performed:

# Delete test file

# Removed the file "Before-Snapshot.txt" from the Desktop to simulate data loss.

# Command used:

Remove-Item -Path "$env:USERPROFILE\Desktop\Before-Snapshot.txt"
# ----------------------------------------------------------

# ----------------------------------------------------------

# Uninstall IIS (Web Server)

# Removed the Internet Information Services (IIS) role to simulate a broken system.

# Command used:

Uninstall-WindowsFeature -Name Web-Server -IncludeManagementTools

# Purpose:

# This step creates a “broken” VM state so that the snapshot can later be used to restore the OS disk, bringing back the deleted file and the IIS configuration.
# ----------------------------------------------------------
