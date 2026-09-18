# Enterprise IT Support Lab — Start Here

This repository documents a hands-on enterprise IT Support / Service Desk environment combining traditional Windows infrastructure with Microsoft cloud-based identity and endpoint management.

The project is divided into two main technical environments:

1. **Windows Server & Active Directory**
2. **Microsoft 365, Entra ID & Intune**

Each runbook documents the configuration process, troubleshooting, validation and screenshot evidence from the lab.

---

## 🖥️ Part A — Windows Server & Active Directory

**[Open the Complete Windows Server & Active Directory Runbook](MASTER-LAB-GUIDE.md)**

This environment includes:

- Windows Server 2022
- Active Directory Domain Services
- Windows 11 domain client
- DNS and DHCP
- Organisational Units, users and security groups
- Group Policy
- NTFS and SMB permissions
- Departmental RBAC
- Account lockout troubleshooting
- Windows Defender and Firewall
- Event Viewer and failed-logon investigation
- PowerShell helpdesk automation
- Domain and secure-channel validation

### Detailed AD Sections

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

---

## ☁️ Part B — Microsoft 365, Entra ID & Intune

**[Open the Complete Microsoft 365 / Entra ID / Intune Runbook](13-Microsoft-365-Entra-Intune/README.md)**

This environment includes:

- Microsoft 365 Business Premium
- Microsoft Entra ID
- Cloud users and security groups
- Microsoft Intune
- Windows 11 Entra Join
- Automatic MDM enrollment
- Device compliance
- Defender and Firewall configuration
- Company Portal deployment
- Password reset and sign-in troubleshooting
- Microsoft 365 service-plan troubleshooting
- Exchange Online mail-flow validation
- Session revocation and reauthentication
- Entra audit-log investigation
- Access lifecycle management
- Conditional Access testing in Report-only mode
- Final endpoint and MDM validation

### Detailed Cloud Sections

1. [Tenant, Business Premium and MFA](13-Microsoft-365-Entra-Intune/01-Tenant-Subscription-and-MFA.md)
2. [Users, Licensing and Security Groups](13-Microsoft-365-Entra-Intune/02-Users-Licensing-and-Security-Groups.md)
3. [Microsoft Entra Verification](13-Microsoft-365-Entra-Intune/03-Entra-Verification.md)
4. [Intune Enrollment and Windows 11](13-Microsoft-365-Entra-Intune/04-Intune-Enrollment-and-Windows11.md)
5. [Intune Compliance Policy](13-Microsoft-365-Entra-Intune/05-Compliance-Policy.md)
6. [Intune Security Configuration](13-Microsoft-365-Entra-Intune/06-Configuration-Baseline.md)
7. [Company Portal Deployment](13-Microsoft-365-Entra-Intune/07-App-Deployment-Company-Portal.md)
8. [Microsoft 365 Helpdesk and Exchange](13-Microsoft-365-Entra-Intune/08-M365-Helpdesk-and-Exchange.md)
9. [Entra Access Lifecycle and Audit](13-Microsoft-365-Entra-Intune/09-Entra-Access-and-Audit.md)
10. [Conditional Access](13-Microsoft-365-Entra-Intune/10-Conditional-Access.md)
11. [Final Endpoint / MDM Validation](13-Microsoft-365-Entra-Intune/11-Final-Validation.md)

---

## 🔧 Troubleshooting & Technical Resources

### Troubleshooting

**[Troubleshooting Log](11-Troubleshooting-Log.md)**

Documents real issues encountered during the Windows / Active Directory lab, including DNS registration, account lockout, access control and system troubleshooting.

### Commands

**[Command Cheat Sheet](12-Command-Cheat-Sheet.md)**

Contains the Windows, networking, Active Directory, Group Policy and PowerShell commands used for configuration and validation.

### PowerShell Automation

**[Helpdesk AD Toolkit](../scripts/Helpdesk-AD-Toolkit.ps1)**

Reusable PowerShell functions created for common Active Directory support tasks:

- `Get-ADUserHealth`
- `Unlock-HelpdeskUser`
- `Get-DepartmentMembers`
- `Get-FailedPasswordStatus`

---

## 📸 Evidence

The repository contains screenshot evidence throughout the runbooks.

**Windows / Active Directory evidence:**  
[AD Screenshot Index](AD-Screenshot-Index.md)

**Microsoft 365 / Entra / Intune evidence:**  
[Cloud Screenshot Index](13-Microsoft-365-Entra-Intune/SCREENSHOT-INDEX.md)

Screenshots demonstrate both configuration and end-to-end validation rather than configuration screens alone.

---

## 🧪 Lab Architecture

| Component | Configuration |
|---|---|
| Hypervisor | Oracle VirtualBox |
| Domain Controller | `DC01` — Windows Server 2022 |
| On-premises Client | `CLIENT01` — Windows 11 Pro |
| AD Domain | `adlab.local` |
| Internal Network | `192.168.10.0/24` |
| DNS / DHCP Server | `192.168.10.10` |
| Cloud Endpoint | `INTUNE-W11` — Windows 11 Pro |
| Cloud Platform | Microsoft 365 Business Premium |
| Cloud Identity | Microsoft Entra ID |
| Endpoint Management | Microsoft Intune |
| Email | Exchange Online |
| Automation | PowerShell |

---

## 🚀 Recommended Review Path

For a quick review of the project:

1. Read the main repository `README.md`.
2. Review the **Windows Server & Active Directory Runbook**.
3. Review the **Microsoft 365 / Entra ID / Intune Runbook**.
4. Review the **Troubleshooting Log**.
5. Review the **PowerShell Helpdesk Toolkit**.
6. Open the screenshot indexes for additional technical evidence.

For a visual overview, use the **[Interactive IT Support Lab Guide](https://mahadi8566.github.io/enterprise-it-support-lab/)**.

---

## 🎯 Skills Demonstrated

`IT Support` · `Service Desk` · `Desktop Support` · `Windows 11` · `Windows Server 2022` · `Active Directory` · `Microsoft 365` · `Microsoft Entra ID` · `Microsoft Intune` · `Exchange Online` · `DNS` · `DHCP` · `Group Policy` · `PowerShell` · `RBAC` · `NTFS Permissions` · `Microsoft Defender` · `Windows Firewall` · `Conditional Access` · `Device Compliance` · `Application Deployment` · `Troubleshooting`

---

**Project:** Enterprise IT Support Lab  
**Author:** Md Mahadi Hasan
