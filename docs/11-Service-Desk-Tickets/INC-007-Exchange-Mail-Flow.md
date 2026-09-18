# INC-007 — Exchange Online Mail-Flow Validation

**Status:** Resolved / Service validated  
**Category:** Microsoft 365 / Exchange Online  
**Priority:** P3 — Medium  
**Environment:** Exchange Online / Outlook on the web

> Simulated Service Desk ticket reconstructed from troubleshooting completed in this personal lab.

## User report
Internal email delivery between two Microsoft 365 test users required end-to-end validation.

## Investigation
Sarah sent a test message to Michael. Receipt and reply were then checked.

## Resolution
No configuration change was required; the workflow validated both mailboxes and the internal mail path.

## Validation
Sarah sent the message, Michael received it, Michael replied, and the final conversation thread confirmed two-way mail flow.

## Evidence
![Sarah sent](../13-Microsoft-365-Entra-Intune/assets/08-07-Exchange-Sarah-Sent.png)

![Michael received](../13-Microsoft-365-Entra-Intune/assets/08-08-Exchange-Michael-Received.png)

![Two-way thread](../13-Microsoft-365-Entra-Intune/assets/08-10-Exchange-End-to-End-Thread.png)
