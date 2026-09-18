# Microsoft 365, Entra ID & Intune — Complete Step-by-Step Runbook

This folder documents the complete cloud/modern-workplace extension of the Enterprise Windows IT Support Lab.

## Read in this order

1. [Tenant, Business Premium and MFA](01-Tenant-Subscription-and-MFA.md)
2. [Users, Licensing and Security Groups](02-Users-Licensing-and-Security-Groups.md)
3. [Microsoft Entra Verification](03-Entra-Verification.md)
4. [Intune Enrollment and Windows 11](04-Intune-Enrollment-and-Windows11.md)
5. [Intune Compliance Policy](05-Compliance-Policy.md)
6. [Intune Security Configuration Baseline](06-Configuration-Baseline.md)
7. [Company Portal App Deployment](07-App-Deployment-Company-Portal.md)
8. [Microsoft 365 Helpdesk and Exchange](08-M365-Helpdesk-and-Exchange.md)
9. [Entra Access Lifecycle and Audit](09-Entra-Access-and-Audit.md)
10. [Conditional Access](10-Conditional-Access.md)
11. [Final Endpoint / MDM Validation](11-Final-Validation.md)

## Architecture

- **On-premises:** `DC01` + `CLIENT01` in `adlab.local`
- **Cloud:** Microsoft 365 Business Premium + Entra ID + Intune
- **Cloud endpoint:** `INTUNE-W11`
- **Cloud test identities:** IT, HR and Sales users mirroring the on-premises lab

## Documentation rule

The runbook distinguishes between:
- GUI actions actually performed,
- commands actually used,
- results observed in screenshots.

It does not invent commands for GUI-only actions.

## Security / privacy before public publishing

Do not publish raw screenshots containing:
- temporary passwords,
- personal address or phone data,
- public IP addresses,
- unnecessary tenant IDs, object IDs or device IDs.

Redact or crop those items before GitHub, LinkedIn or Medium publication.
