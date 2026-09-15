# 4. DNS, DHCP and Domain Networking

## Step 4.1 — Install and authorise DHCP

On DC01, install the **DHCP Server** role and complete post-install configuration so the server is authorised in Active Directory.

Create a scope for the ADLAB subnet:

- Network: `192.168.10.0/24`
- Lease range: `192.168.10.100` – `192.168.10.200`
- DNS server option: `192.168.10.10`
- Domain DNS suffix: `adlab.local`

**Observed result:** CLIENT01 received `192.168.10.100`, used DHCP server `192.168.10.10`, and used DNS server `192.168.10.10`.

**Evidence — DHCP server and scope configuration**

![DHCP server and scope configuration](evidence/04-DHCP-Server-Configuration.png)


**Evidence — CLIENT01 DHCP, DNS and domain network state**

![CLIENT01 DHCP, DNS and domain network state](evidence/01-CLIENT01-IPConfig-Domain-Network.png)


## Step 4.2 — Validate DNS records

DNS Manager was used to inspect the `adlab.local` forward lookup zone and the `dc01` record.

**Evidence — DC01 DNS record configuration**

![DC01 DNS record configuration](evidence/02-DNS-DC01-Record-Configuration.png)


## Step 4.3 — Discover the domain controller

Command used on CLIENT01:

```cmd
nltest /dsgetdc:adlab.local
```

**Observed result:** The command found `\DC01.adlab.local` at `192.168.10.10` and returned AD service flags such as PDC, GC, LDAP, KDC, TIMESERV, WRITABLE and DNS.

**Evidence — Successful DC discovery with NLTEST**

![Successful DC discovery with NLTEST](evidence/03-DC-Discovery-NLTEST-Success.png)


## Step 4.4 — Troubleshoot the stale NAT DNS record

### Problem observed

`dc01.adlab.local` could register the NAT-facing address `10.0.2.15` in addition to the intended internal address `192.168.10.10`. That is undesirable for domain clients.

### Interface registration check

PowerShell was used to inspect DNS client registration settings:

```powershell
Get-DnsClient | Select-Object InterfaceAlias, RegisterThisConnectionsAddress
```

Final desired state:

- `Ethernet-Internet` → `RegisterThisConnectionsAddress = False`
- `Ethernet-ADLAB` → `RegisterThisConnectionsAddress = True`

Set the internal NIC to register its address:

```powershell
Set-DnsClient -InterfaceAlias "Ethernet-ADLAB" -RegisterThisConnectionsAddress $true
```

The NAT interface remained non-registering.

### Remove the stale record

The stale `dc01` A record for `10.0.2.15` was removed from the `adlab.local` DNS zone. The lab used PowerShell for DNS resource-record cleanup; the equivalent targeted command is:

```powershell
Remove-DnsServerResourceRecord -ZoneName "adlab.local" -RRType "A" -Name "dc01" -RecordData "10.0.2.15" -Force
```

### Clear client cache and retest

On CLIENT01:

```cmd
ipconfig /flushdns
nslookup dc01.adlab.local
ping dc01.adlab.local
```

**Observed result:** DNS returned the intended internal address `192.168.10.10` (plus IPv6 where applicable), no longer the stale NAT IPv4 address. Ping resolved to `192.168.10.10` and succeeded 4/4.

**Evidence — PowerShell DNS cleanup evidence**

![PowerShell DNS cleanup evidence](evidence/05-DNS-Troubleshooting-Cleanup.png)


**Evidence — Final clean DC01 DNS validation**

![Final clean DC01 DNS validation](evidence/06-DNS-DC01-Final-Validation.png)


> Note: `nslookup` displayed DNS server name as `UnKnown` because a reverse PTR record was not configured. Forward DNS and domain operations were still working correctly.
