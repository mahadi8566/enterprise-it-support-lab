# INC-002 — Active Directory DNS Resolution Incident

**Status:** Resolved  
**Category:** Network / DNS  
**Priority:** P2 — High  
**Environment:** DC01 / CLIENT01 / `adlab.local`

> Simulated Service Desk ticket reconstructed from troubleshooting completed in this personal lab.

## User report
Domain services showed inconsistent resolution for `dc01.adlab.local`.

## Investigation
The NAT-facing address `10.0.2.15` could register in DNS alongside the intended ADLAB address `192.168.10.10`.

```powershell
Get-DnsClient | Select-Object InterfaceAlias,RegisterThisConnectionsAddress
```

## Root cause
The unwanted NAT interface address had been registered in the `adlab.local` DNS zone.

## Resolution
The intended ADLAB interface remained registered and the stale NAT A record was removed.

```powershell
Set-DnsClient -InterfaceAlias "Ethernet-ADLAB" -RegisterThisConnectionsAddress $true
Remove-DnsServerResourceRecord -ZoneName "adlab.local" -RRType "A" -Name "dc01" -RecordData "10.0.2.15" -Force
```

## Validation
CLIENT01 cache was flushed, `dc01.adlab.local` resolved to `192.168.10.10`, and connectivity succeeded.

## Evidence
![DNS cleanup](../04-DNS-DHCP-and-Networking/evidence/05-DNS-Troubleshooting-Cleanup.png)

![Final DNS validation](../04-DNS-DHCP-and-Networking/evidence/06-DNS-DC01-Final-Validation.png)
