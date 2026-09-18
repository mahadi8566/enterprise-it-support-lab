# 08 — Microsoft 365 Helpdesk Scenarios

## Objective
Practise common Service Desk workflows: password reset, sign-in investigation, licensing/service-plan troubleshooting, Exchange Online validation and session revocation.

## Scenario A — Password reset
1. Open Sarah Ahmed in Entra / Microsoft 365 admin.
2. Reset the password.
3. Give the temporary credential to the simulated user.
4. Validate successful sign-in.
5. Review Entra sign-in logs.

> **Publishing warning:** the raw password-reset screenshot contained a temporary password. The public version used in this repository is redacted.

![Password reset completed](assets/08-01-Password-Reset-Success.png)

*Evidence: password reset completed with the temporary password redacted.*

![Sarah Ahmed interactive sign-in logs](assets/08-02-Sarah-SignIn-Logs.png)

*Evidence: sign-in activity reviewed after remediation.*

## Scenario B — Microsoft 365 service-plan troubleshooting
Verify Business Premium licence and service plans.

![Business Premium licence active](assets/08-03-Business-Premium-License-Active.png)

Open **Manage apps & services** for the user.

![Microsoft 365 service-plan management](assets/08-04-M365-App-Service-Management.png)

A controlled Microsoft Forms access issue was reproduced by disabling the Forms service plan, then the service was restored.

![Microsoft Forms access restored](assets/08-05-Forms-Access-Restored.png)

## Scenario C — Exchange Online mail flow
Sarah opened Outlook on the web:

![Sarah Ahmed Exchange Online mailbox](assets/08-06-Outlook-Sarah-Mailbox.png)

Sarah sent a test message to Michael Brown:

![Sarah sent Exchange Online test email](assets/08-07-Exchange-Sarah-Sent.png)

Michael received the email:

![Michael received the test email](assets/08-08-Exchange-Michael-Received.png)

Michael replied:

![Michael replied to the test message](assets/08-09-Exchange-Michael-Reply.png)

The final thread confirmed two-way internal mail flow:

![Two-way Exchange Online mail flow validated](assets/08-10-Exchange-End-to-End-Thread.png)

## Scenario D — Revoke sessions
From Sarah's Entra user page, select **Revoke sessions** and confirm.

![Sign-in sessions revoked](assets/08-11-Revoke-Sessions-Success.png)

Refresh the user's Microsoft 365 session. The user is required to enter the password again, confirming that the previous session was invalidated.

![Reauthentication required after session revocation](assets/08-12-Reauthentication-Required.png)

*Evidence: the user was forced to re-authenticate after session revocation.*

## Result
The lab covered realistic cloud Service Desk administration across identity, licensing, mail and session security.
