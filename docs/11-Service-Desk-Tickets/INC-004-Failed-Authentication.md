# INC-004 — Failed Authentication Investigation

**Status:** Resolved / Investigated  
**Category:** Authentication / Security Event  
**Priority:** P3 — Medium  
**Environment:** Windows 11 / Active Directory / Event Viewer

> Simulated Service Desk ticket reconstructed from troubleshooting completed in this personal lab.

## User report
A failed domain authentication required investigation.

## Investigation
Advanced logon auditing was enabled for Success and Failure. A controlled failed sign-in was generated and the Security log was filtered for Event ID `4625`.

Captured details included:
- Account: `sahmed`
- Domain: `ADLAB`
- Computer: `CLIENT01.adlab.local`
- Failure reason: unknown user name or bad password

## Root cause
The controlled test authentication used an incorrect password.

## Resolution
The event was correlated to the intended test account and the user subsequently authenticated correctly.

## Validation
The failed authentication was attributable in Event Viewer and normal sign-in remained functional.

## Evidence
![Audit policy](../08-Auditing-and-Event-Viewer/evidence/02-Audit-Policy-CLIENT01-Verified.png)

![Event 4625](../08-Auditing-and-Event-Viewer/evidence/03-Event4625-Failed-Logon-sahmed.png)
