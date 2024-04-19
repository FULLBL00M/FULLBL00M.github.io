# Define paths
$rootDir = (Resolve-Path "..").Path
$pagesDir = Join-Path $rootDir "pages"
$indexSassFile = Join-Path $rootDir "index.scss"
$indexCssFile = Join-Path $rootDir "index.css"

# Function to update or append SCSS content to index.scss
function UpdateIndexScssContent($inputFile) {
    $fileName = [System.IO.Path]::GetFileName($inputFile)
    Write-Host "Processing SCSS file: $fileName"

    # Get the content of the input SCSS file
    $newContent = Get-Content -Path $inputFile -Raw

    # Read the entire content of index.scss
    $indexContent = Get-Content -Path $indexSassFile -Raw

    # Define the start and end tags for the section corresponding to the input file
    $startTag = "// Source: $fileName"
    $endTag = "// EndSource: $fileName"

    # Check if the section for the input file exists in index.scss
    if ($indexContent -match [regex]::Escape($startTag)) {
        # Replace the existing section for the input file with the new content
        $indexContent = $indexContent -replace "(?s)${startTag}.*?${endTag}", "$startTag`n$newContent`n$endTag"
    }
    else {
        # Append the new section to index.scss if it doesn't exist
        $indexContent += "`n$startTag`n$newContent`n$endTag`n"
    }

    # Write the updated content back to index.scss
    Set-Content -Path $indexSassFile -Value $indexContent
    Write-Host "SCSS content from '$fileName' updated in index.scss"
}

# Function to compile index.scss to index.css
function CompileIndexSassToCss() {
    Write-Host "Compiling index.scss to index.css"
    & "npx" "node-sass" $indexSassFile $indexCssFile
    Write-Host "index.scss compiled successfully to index.css"
}

# Function to compile Pug file to HTML in the same folder
function CompilePugInFolder($inputFile) {
    $fileName = [System.IO.Path]::GetFileName($inputFile)
    $outputDir = [System.IO.Path]::GetDirectoryName($inputFile)
    $outputFile = Join-Path $outputDir ([System.IO.Path]::GetFileNameWithoutExtension($inputFile) + ".html")

    Write-Host "Compiling Pug file: $fileName to HTML in folder: $outputDir"

    # Compile Pug to HTML
    & "npx" "pug" $inputFile "--out" $outputDir
    Write-Host "Pug file '$fileName' compiled successfully to '$outputFile'"
}

# Compile all SCSS files in the pages directory
Get-ChildItem -Path $pagesDir -Recurse -Include *.scss | ForEach-Object {
    UpdateIndexScssContent $_.FullName
}

# Compile all Pug files in the pages directory
Get-ChildItem -Path $pagesDir -Recurse -Include *.pug | ForEach-Object {
    CompilePugInFolder $_.FullName
}

# Compile index.scss to index.css
CompileIndexSassToCss
npx pug ../index.pug