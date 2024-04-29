# Define paths
$rootDir = (Resolve-Path "..").Path
$componentsDir = Join-Path $rootDir "components"

# Prompt for the name of the new component
$componentName = Read-Host "Enter the name of your new component"

# Create a new directory for the component
$newComponentDir = Join-Path $componentsDir $componentName
New-Item -Path $newComponentDir -ItemType Directory -Force | Out-Null

# Define the Pug template as a multi-line string for the component
$pugTemplate = @"
doctype html
html(lang="en")
    include ../head
    +head
    body
        include ../header
        +header

        // Component-specific content goes here

        include ../footer
        +footer
"@

# Prompt for each file type and create default files for the component
$fileTypes = @("pug", "scss", "js")
foreach ($fileType in $fileTypes) {
    $createFile = Read-Host "Create $fileType file for the new component? (Y/N)"
    if ($createFile -eq "Y" -or $createFile -eq "y") {
        $fileName = "$componentName.$fileType"
        $filePath = Join-Path $newComponentDir $fileName
        New-Item -Path $filePath -ItemType File -Force | Out-Null
        
        # Write the template content to the file
        if ($fileType -eq "pug") {
            $pugTemplate | Set-Content -Path $filePath
        }
        
        Write-Host "Created $fileName for the new component."
    }
}

Write-Host "New component '$componentName' created successfully."
