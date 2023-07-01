# SysmonInstall
This PowerShell script automates the isntallation or update of Sysmon, a powerful system monitoring tool developed by Microsoft. It allows you to easily install or update Sysmon on your system and configure it using the provided sysmon.xml file.

## Prerequisites

- This script requires **administrative privileges** to execute. Ensure that you run it as an administrator.

## Usage

1. Download the script file `sysmon_setup.ps1` to your local machine.

2. Open a PowerShell console and navigate to the directory where you saved the script.

3. Run the script using one of the following options:

   - To install Sysmon for the first time, use the command:
     ```powershell
     .\sysmon_setup.ps1 [install|i]
     ```
     
   - To update an existing Sysmon configuration, use the command:
     ```powershell
     .\sysmon_setup.ps1 [update|u]
     ```

4. The script will download the necessary files from the internet, unzip them, and execute Sysmon with the appropriate parameters.

5. Once the setup is complete, the script will clean up the downloaded files.

## Credits

- Sysmon configuration file: [SwiftOnSecurity/sysmon-config](https://github.com/SwiftOnSecurity/sysmon-config)

- Sysmon by Microsoft: [Microsoft Sysinternals - Sysmon](https://docs.microsoft.com/sysinternals/downloads/sysmon)

## License

This script is released under the [GNU General Public License v3.0](LICENSE).
