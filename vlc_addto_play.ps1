$main_path="Registry::HKEY_CLASSES_ROOT\Directory\shell"
$target_name=@("PlayWithVLC", "AddToPlaylistVLC")

foreach ($entry in $target_name) {
    Write-Output "Remove [$main_path\$entry]"
    Remove-Item -Path $main_path\$entry -Recurse
}
