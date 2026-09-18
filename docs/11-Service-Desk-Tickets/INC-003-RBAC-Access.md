# INC-003 — Department Share Access / RBAC Validation

**Status:** Resolved / Expected access model confirmed  
**Category:** Access & Permissions  
**Priority:** P3 — Medium  
**Environment:** Active Directory / SMB / NTFS / CLIENT01

> Simulated Service Desk ticket reconstructed from troubleshooting completed in this personal lab.

## User report
A Sales user required access to the Sales share while HR and IT data had to remain restricted.

## Investigation
```cmd
whoami
net use
dir S:\
dir \\DC01\Sales
dir \\DC01\HR
dir \\DC01\IT
```

AD group membership, share permissions and NTFS permissions were reviewed.

## Resolution
Department access used AD security groups rather than direct per-user permissions. `GG_Sales_Users` was authorised for the Sales share.

## Validation
The Sales drive was accessible while HR and IT returned **Access is denied**, confirming least privilege.

## Evidence
![Share permissions](../06-File-Shares-and-RBAC/evidence/01-Share-Permission-Configuration.png)

![Sales drive mapped](../06-File-Shares-and-RBAC/evidence/02-Sales-Drive-Mapped-Sarah.png)

![Restricted access](../06-File-Shares-and-RBAC/evidence/03-Sales-User-RBAC-Access-Denied.png)
