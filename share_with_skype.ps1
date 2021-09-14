# Automatically remove "share with skype" from contextual menu
$main_path="HKLM:\SOFTWARE\Classes\PackagedCom\Package"
$target_name="\Class\{776DBC8D-7347-478C-8D71-791E12EF49D8}"

# Get list of skype entries
$Skype_reg_entry = Get-ChildItem -path $main_path | Where-Object {$_.name -match  "Microsoft.SkypeApp_*"}
foreach ($entry in $Skype_reg_entry) {
    $Full_path =  "Registry::" + $entry.Name +  $target_name
    Write-Host "remove key: [$Full_path]"

    #$item = get-item -path $Full_path -ErrorAction SilentlyContinue
    $item = get-item -path $Full_path
    if ( $($item | Get-ItemProperty -name "DllPath" -ErrorAction SilentlyContinue)  -ne $null ) {
        Write-Output "try to remove item DllPath" + $item
        $item | Remove-ItemProperty -name "DllPath"
        #Write-Host "##### property removed #####"
    } else {
        Write-Host "property not found, continue..."
    }
}
Write-Host "finished"