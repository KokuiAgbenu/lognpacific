<#
.SYNOPSIS
    Sets the SCENoApplyLegacyAuditPolicy registry key (DWORD=1) under HKLM\SYSTEM\CurrentControlSet\Control\Lsa to enforce STIG compliance

.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/kokuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 29-09-2025
    Last Modified   : 29-09-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-SO-000030.ps1 
#>

# Create or update the SCENoApplyLegacyAuditPolicy registry value as DWORD=1

New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -Value 1 -PropertyType DWord -Force  

# Verify the value was applied (should return 1 if successful)
Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" | Select-Object SCENoApplyLegacyAuditPolicy  
 
