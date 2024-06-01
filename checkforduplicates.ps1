$folders = @("X:\Folder1", "X:\Folder2", "X:\Folder3", "X:\Folder4")

# Initialize array to store matching directory names
$matchingDirectoryNames = @()

# Set the active folder as the first folder in the list
$activeFolder = $folders[0]

# Get directory names from the active folder
$activeDirectoryNames = (Get-ChildItem -Path $activeFolder -Directory).Name

# Extract first word from each directory name in the active folder
$activeDirectoryWords = $activeDirectoryNames | ForEach-Object {
    $_ -replace '^([^(]+).*$', '$1'
}

# Loop through each remaining folder in the list to compare
for ($i = 1; $i -lt $folders.Count; $i++) {
    $otherFolder = $folders[$i]
    
    # Get directory names from the other folder
    $otherDirectoryNames = (Get-ChildItem -Path $otherFolder -Directory).Name
    
    # Extract first word from each directory name in the other folder
    $otherDirectoryWords = $otherDirectoryNames | ForEach-Object {
        $_ -replace '^([^(]+).*$', '$1'
    }
    
    # Compare directory names and add matching names to the result array
    $matchingNames = $activeDirectoryWords | Where-Object {
        $currentDirectoryName = $_
        $otherDirectoryWords -contains $currentDirectoryName
    }
    
    # Add matching names to the result array
    $matchingDirectoryNames += $matchingNames
}

# Output unique matching directory names
$matchingDirectoryNames | Sort-Object -Unique
