# Enterprise IT Support Lab — Start Here

This repository documents a hands-on enterprise IT Support environment combining:

- Windows Server 2022
- Active Directory Domain Services
- Windows 11
- DNS and DHCP
- Group Policy
- File-share permissions and RBAC
- PowerShell helpdesk automation
- Microsoft 365
- Microsoft Entra ID
- Microsoft Intune
- Exchange Online
- Device compliance
- Endpoint security
- Conditional Access
- Troubleshooting and validation

The project is structured as a repeatable technical runbook with screenshots, commands, troubleshooting notes and validation evidence.

---

## Interactive Lab Guide

For the easiest visual overview of the complete environment:

**[Open the Interactive IT Support Lab Guide](https://mahadi8566.github.io/enterprise-it-support-lab/)**

---

## Windows Server & Active Directory Runbook

The on-premises portion covers the complete Windows enterprise environment.

### Sections

1. [Infrastructure and VM Setup](01-Infrastructure-and-VM-Setup/)
2. [AD DS and Domain Join](02-AD-DS-and-Domain-Join/)
3. [Active Directory Structure](03-Active-Directory-Structure/)
4. [DNS, DHCP and Networking](04-DNS-DHCP-and-Networking/)
5. [Group Policy and Endpoint Security](05-Group-Policy-and-Endpoint-Security/)
6. [File Shares and RBAC](06-File-Shares-and-RBAC/)
7. [Account Lockout and Helpdesk](07-Account-Lockout-and-Helpdesk/)
8. [Auditing and Event Viewer](08-Auditing-and-Event-Viewer/)
9. [PowerShell Automation](09-PowerShell-Automation/)
10. [Final Validation](10-Final-Validation/)

Additional documentation:

- [Troubleshooting Log](11-Troubleshooting-Log.md)
- [Command Cheat Sheet](12-Command-Cheat-Sheet.md)
- [AD Screenshot Index](AD-Screenshot-Index.md)
- [Master AD Lab Guide](MASTER-LAB-GUIDE.md)

---

## Microsoft 365, Entra ID & Intune Runbook

The cloud extension covers modern Microsoft workplace administration and Service Desk scenarios.

**[Open the Complete Microsoft 365 / Entra ID / Intune Runbook](13-Microsoft-365-Entra-Intune/README.md)**

The cloud lab includes:

- Microsoft 365 Business Premium tenant administration
- Microsoft Entra ID users and security groups
- Licensing and service-plan troubleshooting
- Password reset and sign-in log investigation
- Session revocation and reauthentication testing
- Exchange Online mail-flow validation
- Windows 11 Entra Join
- Microsoft Intune enrollment
- Company Portal deployment
- Device compliance policies
- Defender and Windows Firewall configuration
- Audit-log investigation
- Conditional Access validation in Report-only mode

---

## Lab Environment

| Area | Configuration |
|---|---|
| Hypervisor | Oracle VirtualBox |
| Domain Controller | `DC01` — Windows Server 2022 |
| On-prem Client | `CLIENT01` — Windows 11 Pro |
| AD Domain | `adlab.local` |
| Internal Network | `192.168.10.0/24` |
| DC / DNS / DHCP | `192.168.10.10` |
| Cloud Endpoint | `INTUNE-W11` |
| Cloud Platform | Microsoft 365 Business Premium |
| Identity | Active Directory + Microsoft Entra ID |
| Endpoint Management | Microsoft Intune |

---

## Documentation Approach

- GUI actions are documented as GUI actions.
- Commands are included only where command-line work was actually used.
- Optional equivalents are clearly identified.
- Screenshots are used as evidence for important configuration and troubleshooting results.
- Lab identities and systems are isolated test resources created for portfolio and learning purposes.

---

## Recommended Reading Order

If you are reviewing this project for the first time:

1. Start with the [Interactive Lab Guide](https://mahadi8566.github.io/enterprise-it-support-lab/)
2. Review the Windows / Active Directory runbook
3. Review the [Microsoft 365 / Entra ID / Intune runbook](13-Microsoft-365-Entra-Intune/README.md)
4. Review the troubleshooting log
5. Review the PowerShell toolkit in [`../scripts/Helpdesk-AD-Toolkit.ps1`](../scripts/Helpdesk-AD-Toolkit.ps1)

---

**Project:** Enterprise IT Support Lab  
**Author:** Md Mahadi Hasan
