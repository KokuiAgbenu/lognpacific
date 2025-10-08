<#
.SYNOPSIS
    # Prevents apps (e.g., Cortana, voice assistants) from activating with voice input from the lock screen. 

.HOW?
    # Sets AllowDomainPINLogon (DWORD=0) under HKLM\SOFTWARE\Policies\Microsoft\Windows\System to enforce STIG compliance

.STIG RATIONALE
    # PIN-based logon for domain accounts can weaken authentication controls. Enforcing password-only authentication ensures stronger alignment with enterprise security and STIG requirements.

.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/kokuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 08-10-2025
    Last Modified   : 08-10-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000370 .ps1 

.SCRIPT

# Define the registry path for Windows System policies
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

# Ensure the registry path exists (creates parent keys if missing)
New-Item -Path $RegPath -Force | Out-Null

# Create or update AllowDomainPINLogon as DWORD=0
New-ItemProperty -Path $RegPath -Name "AllowDomainPINLogon" -Value 0 -PropertyType DWord -Force

# Verify the value (should return 0 if applied correctly)
Get-ItemProperty -Path $RegPath | Select-Object AllowDomainPINLogon
