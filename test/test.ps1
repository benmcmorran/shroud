$output = & "$PSScriptRoot\..\out\install\release\bin\tracebld.exe" /m:mapping.json cmd.exe /c "type wrong.txt"
$output
if (($output -join " ").Contains("correct output")) {
    exit 0
} else {
    exit 1
}