$parentFolderPath = "X:\Folder1"
$fileTypes = @("*.mkv", "*.mp4", "*.avi", "*.mpg", "*.m2ts")
$ignoredDirectoryNames = @("metadata", "extrafanart", "extrathumbs", "Sample", "Proof", "Subs", "Screens")

# Get all directories recursively
$directories = Get-ChildItem -Path $parentFolderPath -Directory -Recurse

# Loop through each directory
foreach ($directory in $directories) {
    # Check if the current directory's name matches any of the ignored directory names
    if ($ignoredDirectoryNames -contains $directory.Name) {
        continue
    }


    $filesFound = $false
    
    # Check for each file type
    foreach ($fileType in $fileTypes) {
        $files = Get-ChildItem -LiteralPath $directory.FullName -Filter $fileType -File -Recurse
        
        # If any files are found, mark as found and break the inner loop
        if ($files) {
            $filesFound = $true
            break
        }
    }
    
    # If any files of the specified types are found, output the directory path
    if ($filesFound) {
    #	do nothing, else output path.
    } 
    else	{
        Write-Output $directory.FullName
    }
}
