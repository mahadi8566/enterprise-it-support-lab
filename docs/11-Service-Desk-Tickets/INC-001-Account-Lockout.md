# INC-001 — Active Directory Account Lockout

**Status:** Resolved  
**Category:** Identity & Access  
**Priority:** P3 — Medium  
**Environment:** Windows Server 2022 / Active Directory / CLIENT01

> Simulated Service Desk ticket reconstructed from troubleshooting completed in this personal lab.

## User report
Sales user Sarah Ahmed (`sahmed`) could not sign in after repeated incorrect password attempts.

## Investigation
```powershell
Get-ADUser -Identity sahmed -Properties LockedOut,BadPwdCount,LastBadPasswordAttempt |
  Select-Object SamAccountName,LockedOut,BadPwdCount,LastBadPasswordAttempt
```

Observed: `LockedOut = True`, `BadPwdCount = 5`.

## Root cause
The configured domain account-lockout policy was triggered after five invalid logon attempts.

## Resolution
```powershell
Unlock-ADAccount -Identity sahmed
```

## Validation
The account returned to `LockedOut = False` and successful user sign-in was confirmed.

## Evidence
![Locked account detected](../07-Account-Lockout-and-Helpdesk/evidence/01-Account-Lockout-Detected.png)

![Account unlocked](../07-Account-Lockout-and-Helpdesk/evidence/02-PowerShell-Unlock-HelpdeskUser.png)

## Service Desk note
If repeated lockout occurs, investigate cached credentials, mapped drives, scheduled tasks or other sources of stale passwords.
