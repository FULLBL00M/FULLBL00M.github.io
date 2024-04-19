# Define paths
$rootDir = (Resolve-Path "..").Path
$pagesDir = Join-Path $rootDir "pages"

# Prompt for the name of the new page
$pageName = Read-Host "Enter the name of your new page"

# Create a new directory for the page
$newPageDir = Join-Path $pagesDir $pageName
New-Item -Path $newPageDir -ItemType Directory -Force | Out-Null

# Define the Pug template as a multi-line string
$pugTemplate = @"
doctype html
html(lang="en")
    include components/head
    +head
    body
        include components/header
        +header

        main.container
            .row
                .col-12

        include components/footer
        +footer
"@

# Prompt for each file type and create default files
$fileTypes = @("pug", "scss", "js")
foreach ($fileType in $fileTypes) {
    $createFile = Read-Host "Create $fileType file for the new page? (Y/N)"
    if ($createFile -eq "Y" -or $createFile -eq "y") {
        $fileName = "$pageName.$fileType"
        $filePath = Join-Path $newPageDir $fileName
        New-Item -Path $filePath -ItemType File -Force | Out-Null
        
        # Write the template content to the file
        if ($fileType -eq "pug") {
            $pugTemplate | Set-Content -Path $filePath
        }
        
        Write-Host "Created $fileName for the new page."
    }
}

Write-Host "New page '$pageName' created successfully."
