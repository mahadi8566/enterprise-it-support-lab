# Enterprise Windows & Microsoft 365 IT Support Lab

Hands-on enterprise-style IT Support / Service Desk lab covering **Windows Server 2022, Active Directory, Microsoft 365, Microsoft Entra ID, Microsoft Intune, Windows 11, PowerShell, endpoint security and troubleshooting**.

This project demonstrates both a traditional on-premises Windows environment and a modern Microsoft cloud-managed workplace.

## Project Highlights

### On-premises Windows / Active Directory
- Built an Active Directory domain: `adlab.local`
- Configured Windows Server 2022 as Domain Controller, DNS and DHCP server
- Joined Windows 11 workstation `CLIENT01` to the domain
- Created organisational units, users and role-based security groups
- Implemented departmental file shares for IT, HR and Sales
- Applied NTFS/share permissions using least-privilege RBAC
- Deployed mapped drives and workstation policies with Group Policy
- Configured account lockout, Defender, Firewall and advanced logon auditing
- Investigated Event ID 4625, DNS registration and domain secure-channel issues
- Built a reusable PowerShell helpdesk toolkit

### Microsoft 365 / Entra ID / Intune
- Built a Microsoft 365 Business Premium lab environment
- Administered Entra ID users and departmental security groups
- Performed password reset, sign-in-log review and session revocation
- Troubleshot Microsoft 365 licensing/service-plan access
- Validated two-way Exchange Online mail flow
- Microsoft Entra joined and Intune enrolled `INTUNE-W11`
- Deployed Microsoft Company Portal through Intune
- Created and validated Windows compliance requirements
- Deployed Defender and Windows Firewall configuration through Intune
- Audited temporary group-access changes and restored least privilege
- Created a Conditional Access policy requiring a compliant device
- Validated Conditional Access safely in **Report-only** mode

## Documentation

### On-premises Windows / Active Directory
🌐 **[View the Complete Interactive AD Lab Guide](https://mahadi8566.github.io/enterprise-windows-it-support-lab/)**

- [Start Here](docs/00-START-HERE.md)
- [Troubleshooting Log](docs/11-Troubleshooting-Log.md)
- [Command Cheat Sheet](docs/12-Command-Cheat-Sheet.md)

### Microsoft 365 / Entra ID / Intune
📘 **[View the Complete Microsoft 365, Entra ID & Intune Step-by-Step Runbook](docs/13-Microsoft-365-Entra-Intune/README.md)**

The cloud runbook includes configuration steps, troubleshooting decisions, commands used, observed results and screenshot evidence.

---

## Selected Cloud Evidence

### Intune-managed and compliant Windows 11 endpoint
![Intune managed and compliant Windows 11 endpoint](docs/13-Microsoft-365-Entra-Intune/assets/04-08-Entra-Joined-Intune-Compliant.png)

### Compliance checks
![All configured compliance checks passed](docs/13-Microsoft-365-Entra-Intune/assets/05-10-Per-Setting-All-Compliant.png)

### Intune security policy deployment
![Intune security configuration deployed successfully](docs/13-Microsoft-365-Entra-Intune/assets/06-08-Config-Deployment-Succeeded.png)

### Company Portal deployment
![Company Portal deployment status](docs/13-Microsoft-365-Entra-Intune/assets/07-07-Company-Portal-Device-Installed-Status.png)

### Conditional Access validation
![Conditional Access Report-only validation](docs/13-Microsoft-365-Entra-Intune/assets/10-03-Conditional-Access-ReportOnly-Success.png)

---

## Lab Environment

| Component | Configuration |
|---|---|
| Hypervisor | Oracle VirtualBox |
| Domain Controller | Windows Server 2022 (`DC01`) |
| On-prem Client | Windows 11 Pro (`CLIENT01`) |
| AD Domain | `adlab.local` |
| Internal network | `192.168.10.0/24` |
| DC / DNS / DHCP | `192.168.10.10` |
| Cloud endpoint | Windows 11 (`INTUNE-W11`) |
| Cloud platform | Microsoft 365 Business Premium |
| Identity | Microsoft Entra ID |
| Endpoint management | Microsoft Intune |

## Active Directory Structure

The environment uses separate organisational units for users, computers and groups, with departmental sub-OUs and role-based security groups.

![Active Directory structure](screenshots/02-AD-OU-User-Structure.png)

Examples:

- IT user: `mdmhasan` → `GG_IT_Users`
- Sales user: `sahmed` → `GG_Sales_Users`
- HR user: `mbrown` → `GG_HR_Users`

## DHCP and DNS

`DC01` provides internal DNS and DHCP services for the ADLAB network. `CLIENT01` receives a DHCP lease and uses the domain controller as its DNS server.

![DHCP and DNS](screenshots/03-CLIENT01-DHCP-DNS-Domain-Network.png)

During troubleshooting I found that the NAT-facing IP address of the domain controller had registered in AD DNS. I corrected interface DNS-registration settings, removed the stale A record, flushed the client DNS cache and verified that `dc01.adlab.local` resolved cleanly to `192.168.10.10`.

![DNS validation](screenshots/12-DNS-DC01-Final-Validation.png)

## Group Policy

I created and applied a workstation security baseline to the Windows 11 client OU.

Key controls included:

- Windows Defender Firewall domain profile
- Microsoft Defender real-time protection
- Advanced logon auditing
- Interactive logon security banner
- Account lockout policy
- Department drive mapping using group targeting

![GPO final validation](screenshots/13-GPO-Final-Validation-CLIENT01.png)

## Account Lockout Troubleshooting

The domain account lockout policy was configured to lock accounts after repeated failed authentication attempts.

I intentionally generated failed logons, verified the account lockout state and used PowerShell to investigate and restore access.

![Account lockout detected](screenshots/05-Account-Lockout-Detected.png)

## File Shares and RBAC

Departmental shares were created for IT, HR and Sales. Permissions were assigned to AD security groups rather than individual users.

A Sales user could access the Sales share but was denied access to HR and IT resources, demonstrating least-privilege access control.

![RBAC test](screenshots/08-RBAC-Sales-Allowed-HR-IT-Denied.png)

## Security Event Investigation

Advanced Audit Policy was configured for successful and failed logons. I generated a controlled failed login and investigated Windows Security Event ID `4625`.

![Event 4625](screenshots/11-Event4625-Failed-Logon-sahmed.png)

## PowerShell Helpdesk Toolkit

Reusable Active Directory support script:

[`scripts/Helpdesk-AD-Toolkit.ps1`](scripts/Helpdesk-AD-Toolkit.ps1)

Functions include:

```powershell
Get-ADUserHealth
Unlock-HelpdeskUser
Get-DepartmentMembers
Get-FailedPasswordStatus
```

![PowerShell toolkit](screenshots/14-PowerShell-Helpdesk-AD-Toolkit.png)

## Skills Demonstrated

`Windows Server 2022` · `Windows 11` · `Active Directory` · `Microsoft 365` · `Microsoft Entra ID` · `Microsoft Intune` · `Exchange Online` · `Conditional Access` · `DNS` · `DHCP` · `Group Policy` · `PowerShell` · `NTFS Permissions` · `SMB` · `RBAC` · `Microsoft Defender` · `Windows Firewall` · `Event Viewer` · `Audit Logs` · `Sign-in Logs` · `Device Compliance` · `Application Deployment` · `Authentication Troubleshooting`

## Why I Built This

I built this lab to develop practical skills relevant to IT Support, Service Desk, Desktop Support and Junior Modern Workplace roles. The project includes not only successful configuration but also realistic troubleshooting, user-access administration, security validation and audit evidence.

---

**Author:** Md Mahadi Hasan  
**Target roles:** IT Support · Service Desk · Desktop Support · Junior Systems Administration · Junior Modern Workplace Support
