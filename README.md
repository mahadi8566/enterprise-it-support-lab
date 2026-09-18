# Enterprise IT Support Lab

A recruiter-facing, evidence-backed portfolio demonstrating practical **IT Support, Service Desk, Windows Server, Active Directory, Microsoft 365, Microsoft Entra ID, Microsoft Intune, Exchange Online, PowerShell, endpoint security and troubleshooting**.

This repository combines a Windows domain lab with a Microsoft cloud lab and documents the build, validation, troubleshooting and Service Desk workflow.

> **Portfolio scope:** This is a personal enterprise lab. The Service Desk tickets are simulated cases reconstructed from troubleshooting completed in the lab. They are not presented as employer or customer production tickets.

## Recruiter Quick Start

- 🌐 **Portfolio website:** https://mahadi8566.github.io/enterprise-it-support-lab/
- 🎫 **Service Desk ticket portfolio:** [docs/11-Service-Desk-Tickets/README.md](docs/11-Service-Desk-Tickets/README.md)
- 🪟 **Windows Server & Active Directory master runbook:** [docs/MASTER-LAB-GUIDE.md](docs/MASTER-LAB-GUIDE.md)
- ☁️ **Microsoft 365 / Entra ID / Intune runbook:** [docs/13-Microsoft-365-Entra-Intune/README.md](docs/13-Microsoft-365-Entra-Intune/README.md)
- 🧭 **Complete project navigation:** [docs/00-START-HERE.md](docs/00-START-HERE.md)
- 💻 **PowerShell Helpdesk Toolkit:** [scripts/Helpdesk-AD-Toolkit.ps1](scripts/Helpdesk-AD-Toolkit.ps1)

## Project Architecture

| Area | Lab components |
|---|---|
| On-premises | Windows Server 2022, AD DS, DNS, DHCP, Group Policy, SMB/NTFS, RBAC |
| Windows endpoint | Windows 11 Pro domain client |
| Cloud identity | Microsoft Entra ID |
| Microsoft 365 | Users, groups, licensing, Exchange Online |
| Endpoint management | Microsoft Intune, compliance, Company Portal, endpoint security |
| Security | Defender, Firewall, auditing, Event ID 4625, Conditional Access Report-only |
| Automation | PowerShell Active Directory helpdesk toolkit |
| Service Desk | 8 documented troubleshooting cases |

## Windows Server & Active Directory

The on-premises lab includes:

- Windows Server 2022 domain controller
- Active Directory Domain Services
- DNS and DHCP
- Windows 11 domain join
- Organisational Units, users and security groups
- Group Policy and endpoint security
- Department file shares
- NTFS/SMB permissions and least-privilege RBAC
- Account-lockout troubleshooting
- Event Viewer and failed authentication investigation
- PowerShell administration and automation
- End-to-end health validation

### Lab environment

| Component | Configuration |
|---|---|
| Domain controller | `DC01` — Windows Server 2022 |
| Windows client | `CLIENT01` — Windows 11 Pro |
| AD domain | `adlab.local` |
| ADLAB network | `192.168.10.0/24` |

## Microsoft 365, Entra ID & Intune

The cloud lab includes:

- Microsoft 365 Business Premium test tenant
- User, group and licence administration
- MFA and sign-in validation
- Password reset and session revocation
- Exchange Online two-way mail-flow validation
- Windows 11 Entra join
- Microsoft Intune enrollment
- Compliance policies
- Defender and Firewall configuration
- Company Portal deployment
- Group-access lifecycle and audit logs
- Conditional Access validation in **Report-only** mode

## Service Desk Ticket Portfolio

Eight structured cases demonstrate a consistent support workflow:

**User report → triage → investigation → root cause / interpretation → resolution → validation → documentation**

1. [INC-001 — Active Directory Account Lockout](docs/11-Service-Desk-Tickets/INC-001-Account-Lockout.md)
2. [INC-002 — DNS Resolution / Stale DC Record](docs/11-Service-Desk-Tickets/INC-002-DNS-Resolution.md)
3. [INC-003 — Department Share / RBAC Access](docs/11-Service-Desk-Tickets/INC-003-RBAC-Access.md)
4. [INC-004 — Failed Authentication / Event ID 4625](docs/11-Service-Desk-Tickets/INC-004-Failed-Authentication.md)
5. [INC-005 — Microsoft 365 Password Reset & Sign-in](docs/11-Service-Desk-Tickets/INC-005-M365-Password-SignIn.md)
6. [INC-006 — Microsoft 365 Service-Plan Access](docs/11-Service-Desk-Tickets/INC-006-M365-Service-Plan.md)
7. [INC-007 — Exchange Online Mail Flow](docs/11-Service-Desk-Tickets/INC-007-Exchange-Mail-Flow.md)
8. [INC-008 — Intune Firewall Compliance](docs/11-Service-Desk-Tickets/INC-008-Intune-Compliance.md)

## Selected Evidence

### Active Directory users and groups
![Active Directory users and groups](docs/03-Active-Directory-Structure/evidence/02-AD-Users-and-Groups.png)

### Group Policy validation
![Group Policy validation](docs/05-Group-Policy-and-Endpoint-Security/evidence/06-GPO-Final-Validation-CLIENT01.png)

### RBAC validation
![RBAC validation](docs/06-File-Shares-and-RBAC/evidence/04-RBAC-End-to-End-Validation.png)

### Entra joined, Intune-managed and compliant endpoint
![Intune compliant endpoint](docs/13-Microsoft-365-Entra-Intune/assets/04-08-Entra-Joined-Intune-Compliant.png)

### Exchange Online mail flow
![Exchange Online mail flow](docs/13-Microsoft-365-Entra-Intune/assets/08-10-Exchange-End-to-End-Thread.png)

### Conditional Access Report-only validation
![Conditional Access validation](docs/13-Microsoft-365-Entra-Intune/assets/10-03-Conditional-Access-ReportOnly-Success.png)

## PowerShell

A reusable helpdesk toolkit is included:

```powershell
Get-ADUserHealth
Unlock-HelpdeskUser
Get-DepartmentMembers
Get-FailedPasswordStatus
```

See [scripts/Helpdesk-AD-Toolkit.ps1](scripts/Helpdesk-AD-Toolkit.ps1).

## Skills Demonstrated

`Windows 10/11` · `Windows Server 2022` · `Active Directory` · `DNS` · `DHCP` · `Group Policy` · `Microsoft 365` · `Entra ID` · `Intune` · `Exchange Online` · `Conditional Access` · `PowerShell` · `RBAC` · `Event Viewer` · `Microsoft Defender` · `Windows Firewall` · `Endpoint Compliance` · `Troubleshooting` · `Service Desk Documentation`

## Author

**Md Mahadi Hasan**  
Target roles: **IT Support · Service Desk · Desktop Support · Junior Systems Administration · Junior Microsoft 365 / Modern Workplace Support**
