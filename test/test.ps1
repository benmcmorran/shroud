$output = & "$PSScriptRoot\..\build\release\src\tracebld.exe" /m:mapping.json cmd.exe /c "type wrong.txt"
if (($output -join " ").Contains("correct output")) {
    exit 0
} else {
    exit 1
}