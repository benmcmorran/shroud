$output = & "$PSScriptRoot\..\out\install\x64-release\bin\shroud64.exe" /m:mapping.json cmd.exe /c "type wrong.txt"
$output
if (($output -join " ").Contains("correct output")) {
    exit 0
} else {
    exit 1
}