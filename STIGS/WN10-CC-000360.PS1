<#
.SYNOPSIS
    # Disabling Digest authentication ensures WinRM clients don’t use weak, challenge-response–based authentication, which is vulnerable to replay and brute force attacks.

.HOW?
    # Sets AllowDigest=0 under HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client to disable Digest authentication per STIG (prevents weaker authentication mechanisms)

.STIG RATIONALE
    # Enforcing stronger authentication (such as Kerberos) improves security and aligns with DoD security requirements.

.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/kokuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 11-10-2025
    Last Modified   : 11-10-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000360

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000360.ps1 

.SCRIPT

# Disable Digest authentication for WinRM Client (AllowDigest = 0)
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"

# Ensure the registry path exists
New-Item -Path $RegPath -Force | Out-Null

# Create or update AllowDigest as DWORD set to 0
New-ItemProperty -Path $RegPath -Name "AllowDigest" -Value 0 -PropertyType DWord -Force

# Validation: should return 0
(Get-ItemProperty -Path $RegPath).AllowDigest
