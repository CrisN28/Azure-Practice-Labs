
# These settings will be managed from the Azure portal.

# MFA required → Lab-MFA-Users group

# What it does: forces all members of the Lab-MFA-Users group to complete MFA when accessing the selected apps


# How it was configured (Azure portal):
# Assignments → Users and groups → select Lab-MFA-Users.
# Target resources → All cloud apps.
# Conditions → (optional) leave without additional conditions.
# Access controls → Grant → Require multi-factor authentication.
# Mode: first set to Report-only for testing, then switch to On (Enabled).


# How to test / evidence:
# Register MFA in Microsoft Authenticator with a user from the group → sign in → check Sign-in logs, which should show MFA completed in Azure AD.
