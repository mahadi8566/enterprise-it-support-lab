# ============================================
# Helpdesk AD Toolkit
# Project: Enterprise Windows IT Support Lab
# Domain: adlab.local
# ============================================

Import-Module ActiveDirectory -ErrorAction Stop

function Get-ADUserHealth {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Username
    )

    $User = Get-ADUser -Identity $Username `
        -Properties Enabled, LockedOut, PasswordLastSet, LastLogonDate

    $Groups = Get-ADPrincipalGroupMembership -Identity $Username |
        Select-Object -ExpandProperty Name

    [PSCustomObject]@{
        Username        = $User.SamAccountName
        Enabled         = $User.Enabled
        LockedOut       = $User.LockedOut
        PasswordLastSet = $User.PasswordLastSet
        LastLogonDate   = $User.LastLogonDate
        Groups          = ($Groups -join ", ")
    }
}

function Unlock-HelpdeskUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Username
    )

    $User = Get-ADUser -Identity $Username -Properties LockedOut

    if ($User.LockedOut) {
        Unlock-ADAccount -Identity $Username
        Write-Host "$Username account unlocked successfully."
    }
    else {
        Write-Host "$Username is not currently locked."
    }
}

function Get-DepartmentMembers {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$GroupName
    )

    Get-ADGroupMember -Identity $GroupName |
        Select-Object Name, SamAccountName, ObjectClass
}

function Get-FailedPasswordStatus {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Username
    )

    Get-ADUser -Identity $Username `
        -Properties LockedOut, BadPwdCount, LastBadPasswordAttempt |
        Select-Object SamAccountName, LockedOut, BadPwdCount, LastBadPasswordAttempt
}

# Example usage:
# Get-ADUserHealth -Username mdmhasan
# Unlock-HelpdeskUser -Username sahmed
# Get-DepartmentMembers -GroupName GG_Sales_Users
# Get-FailedPasswordStatus -Username sahmed
