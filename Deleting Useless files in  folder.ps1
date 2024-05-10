
## Author: Jayavishnu Madhiri

# Clear the console
cls

# Initialize a counter variable
$counter = 0

# Get files from specified directory that were last accessed over a year ago
$oldfiles = Get-ChildItem -Path E:\Downloads | Where-Object { $_.LastAccessTime -le (Get-Date).AddDays(-366) }

# Define an empty array to store file information
$deletingfileData = @()

# Iterate through each file
$oldfiles | ForEach-Object {

    # Create a custom object to store file information
    $fileObject = [PSCustomObject]@{
        "index" = $counter++
        "Filename" = $_.Name
        "fileSize_mb" = [math]::Round(($_.Length / 1mb), 2)
        "LastAccessdate" = $_.LastAccessTime
        "Path" = $_.FullName
    }

    # Add the custom object to the array
    $deletingfileData += $fileObject
}

Write-host "The Below Files you are not accessing From a Year" -BackgroundColor Red

# Display file information in a formatted table
$deletingfileData | Format-Table

# Prompt user to input indices of files they don't want to delete
$fileIndicesInputArray = Read-Host "Enter indices of the files separated by commas ','those you don't want to delete, "

# Split the input string into an array of integers representing file indices
$filesToKeep = $fileIndicesInputArray.Split(',') | ForEach-Object { [int]$_ } | Sort-Object

# Initialize variable to track memory freed after deletion
$freedMemory = 0

# Iterate through each file
$deletingfileData | ForEach-Object {

    # If file index is not in the list of files to keep
    if ($_.index -notin $filesToKeep) {

        # Add file size to freed memory
        $freedMemory += $_.fileSize_mb
        # Delete the file (WhatIf flag is used for simulation, remove it for actual deletion)
        Remove-Item -Path $_.Path -Force -WhatIf
    }
}

# Display the amount of memory freed after deletion
Write-Host "After deletion, freed up memory (MB): $freedMemory" -BackgroundColor Red
