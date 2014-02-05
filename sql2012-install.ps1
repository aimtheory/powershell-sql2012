# ==================================== AppD Properties =========================================

$AGTSVCACCOUNT = "NT AUTHORITY\SYSTEM" #$pr_AGTSVCACCOUNT
$AGTSVCSTARTUPTYPE = "Manual" #$pr_AGTSVCSTARTUPTYPE
#$ARCHIVEDISKMOUNTPOINT = $pr_ARCHIVEDISKMOUNTPOINT
#$BINARYDISKMOUNTPOINT = $pr_BINARYDISKMOUNTPOINT
$BROWSERSVCSTARTUPTYPE = "Automatic" #$pr_BROWSERSVCSTARTUPTYPE
#$DATADISKMOUNTPOINT = $pr_DATADISKMOUNTPOINT
$FEATURES = "SQLENGINE,REPLICATION,FULLTEXT,SSMS" #$pr_FEATURES
$FILL_FACTOR = 0 #$pr_FILL_FACTOR
$FTSVCACCOUNT = "NT Service\MSSQLFDLauncher" #$pr_FTSVCACCOUNT
$INDEX_CREATE_MEMORY
$INSTANCEID = "MSSQLSERVER" #$pr_INSTANCEID
$INSTANCENAME = "MSSQLSERVER" #$pr_INSTANCENAME
$LOCKS = 0 #$pr_LOCKS
$MAX_SERVER_MEMORY = #$pr_MAX_SERVER_MEMORY
$MAX_WORKER_THREADS = 0 #$pr_MAX_WORKER_THREADS
$MIN_MEMORY_PER_QUERY = 1024 #$pr_MIN_MEMORY_PER_QUERY
$MIN_SERVER_MEMORY = 0 #$pr_MIN_SERVER_MEMORY
$MSSQL_SETUP_SOURCE = "\\10.115.56.113\repository\Microsoft\SQL\2012\SQLFULL_x64_ENU" #$pr_MSSQL_SETUP_SOURCE
$MSSQL_SETUP_SOURCE_ACCESS_PASSWORD = "Welcome123!" #$pr_MSSQL_SETUP_SOURCE_ACCESS_PASSWORD
$MSSQL_SETUP_SOURCE_ACCESS_USER = "CGCMULAB\iarossi" #$pr_MSSQL_SETUP_SOURCE_ACCESS_USER
$MSSQL_SETUP_SOURCE_TYPE = "WWW" #$pr_MSSQL_SETUP_SOURCE_TYPE
$NPENABLED = 0 #$pr_NPENABLED
$OPTIMIZE_FOR_AD_HOC_WORKLOADS = 0 #$pr_OPTIMIZE_FOR_AD_HOC_WORKLOADS
$PRIORITY_BOOST = 0 #$pr_PRIORITY_BOOST
$RECOVERY_INTERNAL = 0 #$pr_RECOVERY_INTERNAL
$REMOTE_LOGIN_TIMEOUT = 10 #$pr_REMOTE_LOGIN_TIMEOUT
$REMOTE_QUERY_TIMEOUT = 600 #$pr_REMOTE_QUERY_TIMEOUT
$REDOLOGDISKMOUNTPOINT = $pr_REDOLOGDISKMOUNTPOINT
$SAPAWD = "Welcome123!" #$pr_SAPAWD
$SECURITYMODE = "sql" #$pr_SECURITYMODE
$SQLCOLLATION = "SQL_Latin1_General_CP1_CI_AS" #$pr_SQLCOLLATION
$SQLSVCACCOUNT = "NT AUTHORITY\SYSTEM" #$pr_SQLSVCACCOUNT
$SQLSVCSTARTUPTYPE = "Automatic" #$pr_SQLSVCSTARTUPTYPE
$SQLSYSADMINACCOUNTS = "BUILTIN\Administrators" #$pr_SQLSYSADMINACCOUNTS
$TCPENABLED = 1 #$pr_TCPENABLED
$TCPPORT = 1433 #$pr_TCPPORT
$UpdateEnabled = "False" #$pr_UpdateEnabled
$USER_CONNECTIONS = 0 #$pr_USER_CONNECTIONS
# ==================================== Constants ===============================================

$DISK_BINARY_TAG_VALUE = "Binary"
$DISK_DATA_TAG_VALUE = "Data"
$DISK_REDOLOG_TAG_VALUE = "Log"
$DISK_ARCHIVE_TAG_VALUE = "Archive"
$DISK_MOUNTPOINT_KEY = "mountPoint"

$MSSQL_INSTALL_CONFIG_FILE = "$PWD\MSSQLSetup.ini"

#The property name list of supported database parameters
$DB_PARAM_PROPERTY_NAMES = @(
"RECOVERY_INTERVAL"            ,
"USER_CONNECTIONS"             ,
"FILL_FACTOR"                  ,
"MAX_WORKER_THREADS"           ,
"INDEX_CREATE_MEMORY"          ,
"PRIORITY_BOOST"               ,
"REMOTE_LOGIN_TIMEOUT"         ,
"CURSOR_THRESHOLD"             ,
"MIN_MEMORY_PER_QUERY"         ,
"MIN_SERVER_MEMORY"            ,
"MAX_SERVER_MEMORY"            ,
"BACKUP_COMPRESSION_DEFAULT"   ,
"OPTIMIZE_FOR_AD_HOC_WORKLOADS",
"REMOTE_QUERY_TIMEOUT"         ,
"LOCKS"
)

#The database parameter property to parameter name map
$DB_PARAM_PROPERTY_2_PARAM_NAME_MAP = @{
"RECOVERY_INTERVAL"             = "recovery interval (min)"      ;
"USER_CONNECTIONS"              = "user connections"             ;
"FILL_FACTOR"                   = "fill factor (%)"              ;
"MAX_WORKER_THREADS"            = "max worker threads"           ;
"INDEX_CREATE_MEMORY"           = "index create memory (KB)"     ;
"PRIORITY_BOOST"                = "priority boost"               ;
"REMOTE_LOGIN_TIMEOUT"          = "remote login timeout (s)"     ;
"CURSOR_THRESHOLD"              = "cursor threshold"             ;
"MIN_MEMORY_PER_QUERY"          = "min memory per query (KB)"    ;
"MIN_SERVER_MEMORY"             = "min server memory (MB)"       ;
"MAX_SERVER_MEMORY"             = "max server memory (MB)"       ;
"BACKUP_COMPRESSION_DEFAULT"    = "backup compression default"   ;
"OPTIMIZE_FOR_AD_HOC_WORKLOADS" = "optimize for ad hoc workloads";
"REMOTE_QUERY_TIMEOUT"          = "remote query timeout (s)"     ;
"LOCKS"                         = "locks"
}

#The database parameter property to parameter value range map
$DB_PARAM_PROPERTY_2_PARAM_VALUE_RANGE_MAP = @{
"RECOVERY_INTERVAL"             = (0, 32767, 0)               ;
"USER_CONNECTIONS"              = (0, 32767, 0)               ;
"FILL_FACTOR"                   = (0, 100, 0)                 ;
"MAX_WORKER_THREADS"            = (128, 32767, 0)             ;
"INDEX_CREATE_MEMORY"           = (704, 2147483647, 0)        ;
"PRIORITY_BOOST"                = (0, 1, 0)                   ;
"REMOTE_LOGIN_TIMEOUT"          = (0, 2147483647, 10)         ;
"CURSOR_THRESHOLD"              = (-1, 2147483647, -1)        ;
"MIN_MEMORY_PER_QUERY"          = (512, 2147483647, 1024)     ;
"MIN_SERVER_MEMORY"             = (0, 2147483647, 0)          ;
"MAX_SERVER_MEMORY"             = (16, 2147483647, 2147483647);
"BACKUP_COMPRESSION_DEFAULT"    = (0, 1, 0)                   ;
"OPTIMIZE_FOR_AD_HOC_WORKLOADS" = (0, 1, 0)                   ;
"REMOTE_QUERY_TIMEOUT"          = (0, 2147483647, 600)        ;
"LOCKS"                         = (5000, 2147483647, 0)
}


# ==================================== Functions ===============================================

function appdGetDiskAttributeByTag ($diskLayoutInfo, $tagName, $attributeName) {
    $attributeValues = @()
    if (($diskLayoutInfo -ne $null) -And ($diskLayoutInfo -ne "")) {
        $disks = getValueFromJson $diskLayoutInfo "disks"
        foreach ($disk in $disks) {
            $metaTags = getValueFromJson $disk "metaTags"
            foreach ($metaTag in $metaTags) {
                if ($tagName.equals($metaTag)) {
                    $attributeValue = getValueFromJson $disk $attributeName
                    $attributeValues += $attributeValue
                }
            }
        }
    }
    return ,$attributeValues
}

function appdGetDiskAttributeByName ($diskLayoutInfo, $diskName, $attributeName) {
    $attributeValue = $null
    if (($diskLayoutInfo -ne $null) -And ($diskLayoutInfo -ne "")) {
        $disks = getValueFromJson $diskLayoutInfo "disks"
        foreach ($disk in $disks) {
            $idiskname = getValueFromJson $disk "name"
            if ($diskName.equals($idiskname)) {
                $attributeValue = getValueFromJson $disk $attributeName
                break
            }
        }
    }
    return $attributeValue
}

function getDiskMountPointWithDefault ($diskMountPoints, $defaultMountPoint) {
    $diskMountPoint = $null
    if ($diskMountPoints -ne $null -And $diskMountPoints.Count -gt 0) {
        if ($diskMountPoints[0] | %{Test-Path "$($_)" -pathType Container}) {
            $diskMountPoint = $diskMountPoints[0]
        }
    }
    if ($diskMountPoint -eq $null) {
        $diskMountPoint = $defaultMountPoint
    }
    return $diskMountPoint
}


<#
function createMSSQLConfigFile ($MSSQL_INSTALL_CONFIG_FILE) {
    New-Item -ItemType file $MSSQL_INSTALL_CONFIG_FILE
    echo "
[OPTIONS]
ACTION=""Install""
ENU=""True""
QUIET=""True""
QUIETSIMPLE=""False""
IACCEPTSQLSERVERLICENSETERMS=""True""
UpdateEnabled=""$UpdateEnabled""
FEATURES=$FEATURES
UpdateSource=""MU""
HELP=""False""
INDICATEPROGRESS=""False""
X86=""False""
INSTALLSHAREDDIR=""$BINARYDISKMOUNTPOINT\Program Files\Microsoft SQL Server""
INSTALLSHAREDWOWDIR=""$BINARYDISKMOUNTPOINT\Program Files (x86)\Microsoft SQL Server""
INSTANCENAME=""$INSTANCENAME""
INSTANCEID=""$INSTANCEID""
SQMREPORTING=""False""
ERRORREPORTING=""False""
INSTANCEDIR=""$BINARYDISKMOUNTPOINT\Program Files\Microsoft SQL Server""
AGTSVCACCOUNT=""$AGTSVCACCOUNT""
AGTSVCSTARTUPTYPE=""$AGTSVCSTARTUPTYPE""
COMMFABRICPORT=""0""
COMMFABRICNETWORKLEVEL=""0""
COMMFABRICENCRYPTION=""0""
MATRIXCMBRICKCOMMPORT=""0""
SQLSVCSTARTUPTYPE=""$SQLSVCSTARTUPTYPE""
FILESTREAMLEVEL=""0""
SQLCOLLATION=""$SQLCOLLATION""
SQLSVCACCOUNT=""$SQLSVCACCOUNT""
INSTALLSQLDATADIR=""$BINARYDISKMOUNTPOINT\Program Files\Microsoft SQL Server""
SQLBACKUPDIR=""$ARCHIVEDISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Backup""
SQLUSERDBDIR=""$DATADISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Data""
SQLUSERDBLOGDIR=""$REDOLOGDISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Data""
SQLTEMPDBDIR=""$DATADISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Data""
SQLTEMPDBLOGDIR=""$REDOLOGDISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Data""
SQLSYSADMINACCOUNTS=""$SQLSYSADMINACCOUNTS""
SAPWD=""$SAPAWD""
SECURITYMODE=""$SECURITYMODE""
TCPENABLED=""$TCPENABLED""
NPENABLED=""$NPENABLED""
BROWSERSVCSTARTUPTYPE=""$BROWSERSVCSTARTUPTYPE""
FTSVCACCOUNT=""$FTSVCACCOUNT""
"   | out-file -filepath $MSSQL_INSTALL_CONFIG_FILE
}
#>


function validateDbParamValue ($paramName, $paramValue, [int[]]$valueRange) {
    if ($paramValue -ne $null -And $paramValue -ne "") {
        $value = [int]$paramValue
        $minValue = $valueRange[0]
        $maxValue = $valueRange[1]
        $defaultValue = $valueRange[2]
        if ((($value -ge $minValue) -And ($value -le $maxValue)) -Or ($value -eq $defaultValue)) {
            echo "$paramName will be applied to valid value $value."
        } else {
            echo "$paramName cannot be applied with invalid value $value. A valid value should be between $minValue ~ $maxValue, or equal to the default value $defaultValue."
            Exit 1
        }
    }
}


# ==================================== Script Execution ========================================

#Database parameters validation
foreach ($propertyName in $DB_PARAM_PROPERTY_NAMES) {
    $paramName = $DB_PARAM_PROPERTY_2_PARAM_NAME_MAP.Get_Item($propertyName)
    $paramValue = (Get-Variable $propertyName).Value
    $valueRange = $DB_PARAM_PROPERTY_2_PARAM_VALUE_RANGE_MAP.Get_Item($propertyName)
    validateDbParamValue $paramName $paramValue $valueRange
}

#Parse disk_layout_info
$diskLayoutInfo = $DISK_LAYOUT_INFO
echo "disk_layout_info is: $diskLayoutInfo"

#Extract disk mount point list from disk_layout_info by tag
$binaryDiskMountPoints  = appdGetDiskAttributeByTag $diskLayoutInfo $DISK_BINARY_TAG_VALUE $DISK_MOUNTPOINT_KEY
$dataDiskMountPoints    = appdGetDiskAttributeByTag $diskLayoutInfo $DISK_DATA_TAG_VALUE $DISK_MOUNTPOINT_KEY
$redologDiskMountPoints = appdGetDiskAttributeByTag $diskLayoutInfo $DISK_REDOLOG_TAG_VALUE $DISK_MOUNTPOINT_KEY
$archiveDiskMountPoints = appdGetDiskAttributeByTag $diskLayoutInfo $DISK_ARCHIVE_TAG_VALUE $DISK_MOUNTPOINT_KEY

#Get binary, data, redolog, archive disk mount point
$binaryDiskMountPoint  = getDiskMountPointWithDefault $binaryDiskMountPoints  "C:"
$dataDiskMountPoint    = getDiskMountPointWithDefault $dataDiskMountPoints    $binaryDiskMountPoint
$redologDiskMountPoint = getDiskMountPointWithDefault $redologDiskMountPoints $binaryDiskMountPoint
$archiveDiskMountPoint = getDiskMountPointWithDefault $archiveDiskMountPoints $binaryDiskMountPoint

#Parse the sysadmin accounts from $SQLSYSADMINACCOUNTS property
$parsed_SQLSYSADMINACCOUNTS = ""
$SQLSYSADMINACCOUNTS.Split(",") | ForEach {
    $account = $_.Trim()
    $parsed_SQLSYSADMINACCOUNTS += " `"$account`""
}
$parsed_SQLSYSADMINACCOUNTS = $parsed_SQLSYSADMINACCOUNTS.Trim()
if ([string]::IsNullOrEmpty($SQLSYSADMINACCOUNTS.Trim()) -Or [string]::IsNullOrEmpty($parsed_SQLSYSADMINACCOUNTS)) {
    echo "Cannot retrieve SQL Server sysadmin accounts from SQL_SYSADMIN_ACCOUNTS property."
    Exit 1
}

#Create SQL Server 2012 Enterprise Edition Configuration File
#createMSSQLConfigFile $MSSQL_INSTALL_CONFIG_FILE

#Install .NET framework
Import-Module ServerManager
Add-WindowsFeature -Name net-framework

#Access SQL Server package from shared directory
if ($MSSQL_SETUP_SOURCE_ACCESS_USER -eq "") {
    net.exe use Z: "$MSSQL_SETUP_SOURCE"
} else {
    net.exe use Z: "$MSSQL_SETUP_SOURCE" "$MSSQL_SETUP_SOURCE_ACCESS_PASSWORD" /user:"$MSSQL_SETUP_SOURCE_ACCESS_USER"
}

#Check the SQL Server 2012 Enterprise Edition installation files
if (!("Z:" | %{Test-Path "$($_)" -pathType Container})) {
    echo "Failed to add a new network location from $MSSQL_SETUP_SOURCE."
    Exit 1
}
if (!("Z:\setup.exe" | %{Test-Path "$($_)" -pathType Leaf})) {
    echo "Cannot find the setup.exe file of SQL Server 2012 Enterprise Edition."
    Exit 1
}

#Set output INSTALL_PATH property
$INSTALL_PATH="$binaryDiskMountPoint\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL"
echo "SQL Server 2102 Enterprise Edition installation path is set to $INSTALL_PATH."

#Install SQL Server 2012 Enterprise Edition
#Z:\setup.exe /CONFIGURATIONFILE=$MSSQL_INSTALL_CONFIG_FILE
Z:\setup.exe `
    /ACTION=install `
    /ENU="True" `
    /QUIET="True" `
    /QUIETSIMPLE="False" `
    /IACCEPTSQLSERVERLICENSETERMS="True" `
    /UpdateEnabled="$UpdateEnabled" `
    /FEATURES=$FEATURES `
    /UpdateSource="MU" `
    /HELP="False" `
    /INDICATEPROGRESS="False" `
    /X86="False" `
    /INSTALLSHAREDDIR="$BINARYDISKMOUNTPOINT\Program Files\Microsoft SQL Server" `
    /INSTALLSHAREDWOWDIR="$BINARYDISKMOUNTPOINT\Program Files (x86)\Microsoft SQL Server" `
    /INSTANCENAME="$INSTANCENAME" `
    /INSTANCEID="$INSTANCEID" `
    /SQMREPORTING="False" `
    /ERRORREPORTING="False" `
    /INSTANCEDIR="$BINARYDISKMOUNTPOINT\Program Files\Microsoft SQL Server" `
    /AGTSVCACCOUNT="$AGTSVCACCOUNT" `
    /AGTSVCSTARTUPTYPE="$AGTSVCSTARTUPTYPE" `
    /COMMFABRICPORT="0" `
    /COMMFABRICNETWORKLEVEL="0" `
    /COMMFABRICENCRYPTION="0" `
    /MATRIXCMBRICKCOMMPORT="0" `
    /SQLSVCSTARTUPTYPE="$SQLSVCSTARTUPTYPE" `
    /FILESTREAMLEVEL="0" `
    /SQLCOLLATION="$SQLCOLLATION" `
    /SQLSVCACCOUNT="$SQLSVCACCOUNT" `
    /INSTALLSQLDATADIR="$BINARYDISKMOUNTPOINT\Program Files\Microsoft SQL Server" `
    /SQLBACKUPDIR="$ARCHIVEDISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Backup" `
    /SQLUSERDBDIR="$DATADISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Data" `
    /SQLUSERDBLOGDIR="$REDOLOGDISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Data" `
    /SQLTEMPDBDIR="$DATADISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Data" `
    /SQLTEMPDBLOGDIR="$REDOLOGDISKMOUNTPOINT\Program Files\Microsoft SQL Server\MSSQL11.$INSTANCENAME\MSSQL\Data" `
    /SQLSYSADMINACCOUNTS="$parsed_SQLSYSADMINACCOUNTS" `
    /SAPWD="$SAPAWD" `
    /SECURITYMODE="$SECURITYMODE" `
    /TCPENABLED="$TCPENABLED" `
    /NPENABLED="$NPENABLED" `
    /BROWSERSVCSTARTUPTYPE="$BROWSERSVCSTARTUPTYPE" `
    /FTSVCACCOUNT="$FTSVCACCOUNT"

$exitCode = $LastExitCode
if ($exitCode -eq 0) {
    echo "SQL Server 2012 Enterprise Edition installation succeeded!"
    Exit
} elseif ($exitCode -eq 3010) {
    echo "SQL Server 2012 Enterprise Edition installation succeeded! But a restart is required!"
    echo "Restart your computer now ......"
    Exit
} else {
    echo "SQL Server 2012 Enterprise Edition installation failed!"
    Exit 1
}
