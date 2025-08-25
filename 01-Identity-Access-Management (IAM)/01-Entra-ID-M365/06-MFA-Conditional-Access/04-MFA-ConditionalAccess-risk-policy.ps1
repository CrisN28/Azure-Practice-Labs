
# These settings will be managed from the Azure portal.

# Risk-based policy (Identity Protection) → require MFA / block access

#What it does: uses Identity Protection (P2) to evaluate user risk and sign-in risk, then applies automatic actions:

# If sign-in risk = high → Require MFA or If user risk = high (compromised) → Block access.


# How it was configured (Azure portal):
# New policy → Name: MFA required for user/session risk (or similar).
# Assignments → select Lab-MFA-Users (or All users, depending on the case).
# Target resources → All cloud apps (or selected apps).
# Conditions → Risky sign-in: enable and choose levels (e.g., High).
# Conditions → User risk: enable and choose levels (e.g., High for blocking).
# Access controls → Grant → Require multi-factor authentication (for sign-in risk) and/or Block access (for user risk).

# Requirement: Azure AD Premium P2 is needed for these conditions to be available.


# How to test / evidence: trigger a suspicious sign-in (or simulate risk) → Sign-in logs / 
# Identity Protection report will show that the policy was evaluated and the action taken (MFA required or Blocked).