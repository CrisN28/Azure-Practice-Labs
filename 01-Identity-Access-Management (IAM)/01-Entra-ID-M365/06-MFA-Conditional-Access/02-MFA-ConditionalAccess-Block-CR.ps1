# These settings will be managed from the Azure portal.

# Block access from Costa Rica → only Lab-MFA-Users

# What it does: denies access when a member of "Lab-MFA-Users" attempts to sign in from an IP geolocated in Costa Rica.
# How it was configured (portal):

# Named Location: create a location called Costa Rica → Method: IP address determination (IPv4/IPv6) → select country Costa Rica

# New policy → Assignments → Users and groups → select Lab-MFA-Users.

# Target resources → All cloud apps (or specific apps).

# Conditions → Locations → Include → select the Costa Rica location.

# Access controls → Grant → Block access.

# Enable the policy (Enabled).
# Evidence: from an IP in Costa Rica attempt to sign in with a user in the group → Sign-in logs will show Interrupted