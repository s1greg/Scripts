# SentinelOne Windows Installer BAT file

# Directory of SentinelOne Agent Windows Installer
$agentInstallerFolder = ""

# Example: SentinelInstaller_windows_64bit_v23_1_3_647.msi
$agentInstallerBinary = ""

# Token from Management Console
$s1Token = ""

# Optional customerID

$customerID = ""

# Change Directory (CD) into folder with 
cd $agentInstallerFolder
$agentInstallerBinary -t $s1Token