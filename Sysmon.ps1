param (
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateSet("install", "update", "i", "u")]
    [string]$action
)

$disclaimer = @"

*****************************************
*                                       *
*             SysmonInstall             *
*                                       *
*****************************************

  (c) Nicholas Dhaeyer - @DhaeyerWolf.

Sysmon by Microsoft
Sysmon Configuration by SwiftOnSecurity
"@

$disclaimer | Write-Host

# Define the download URLs
$sysmonZipUrl = "https://download.sysinternals.com/files/Sysmon.zip"
$sysmonConfigUrl = "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml"

# Set the file paths
$sysmonZipFile = "$PWD\Sysmon\Sysmon.zip"
$sysmonConfigFile = "$PWD\Sysmon\sysmon.xml"

# Create the Sysmon folder if it doesn't exist
New-Item -ItemType Directory -Force -Path "$PWD\Sysmon" | Out-Null

# Download Sysmon.zip
Invoke-WebRequest -Uri $sysmonZipUrl -OutFile $sysmonZipFile

# Download sysmonconfig-export.xml as sysmon.xml
Invoke-WebRequest -Uri $sysmonConfigUrl -OutFile $sysmonConfigFile

# Unzip Sysmon.zip
Expand-Archive -Path $sysmonZipFile -DestinationPath "$PWD\Sysmon"

# Variable to track success or failure
$success = $false

# Install or update Sysmon based on the provided action parameter
if ($action -eq "install" -or $action -eq "i") {
    # Execute sysmon.exe -accepteula -i sysmon.xml
    Start-Process -FilePath "$PWD\Sysmon\Sysmon.exe" -ArgumentList "-accepteula -i $sysmonConfigFile" -Wait
    $success = $true
}
elseif ($action -eq "update" -or $action -eq "u") {
    # Update Sysmon using sysmon.exe -accepteula -c sysmon.xml
    Start-Process -FilePath "$PWD\Sysmon\Sysmon.exe" -ArgumentList "-accepteula -c $sysmonConfigFile" -Wait
    $success = $true
}

# Forcefully remove the Sysmon folder
Remove-Item -Path "$PWD\Sysmon" -Force -Recurse

# Display ending message
if ($success) {
	Write-Host ""
    Write-Host "~~~ Sysmon setup completed successfully. ~~~"
}
else {
    Write-Host "An error occurred during Sysmon setup. Please check the script and try again."
}
