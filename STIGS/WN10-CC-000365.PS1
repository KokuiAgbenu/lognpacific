<#
.SYNOPSIS
    # Prevents apps (e.g., Cortana, voice assistants) from activating with voice input from the lock screen. 

.HOW?
    # Sets LetAppsActivateWithVoiceAboveLock (DWORD=2) under HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy to enforce STIG compliance

.STIG RATIONALE
    # Reduces attack surface and protects privacy by ensuring apps cannot process voice commands before a user is authenticated.

.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/kokuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 08-10-2025
    Last Modified   : 08-10-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000365

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000365.ps1 

.SCRIPT

# Define the registry path for App Privacy policy
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"

# Ensure the registry path exists (creates parent keys if missing)
New-Item -Path $RegPath -Force | Out-Null

# Create or update LetAppsActivateWithVoiceAboveLock as DWORD=2
New-ItemProperty -Path $RegPath -Name "LetAppsActivateWithVoiceAboveLock" -Value 2 -PropertyType DWord -Force

# Verify the value (should return 2 if applied correctly)
Get-ItemProperty -Path $RegPath | Select-Object LetAppsActivateWithVoiceAboveLock
