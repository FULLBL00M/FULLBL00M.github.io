# Define the path to the index.html file
$htmlFilePath = (Resolve-Path "../index.html").Path

# Path to Google Chrome executable
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Check if Google Chrome is installed
if (Test-Path $chromePath) {
    # Open index.html in Google Chrome
    Start-Process -FilePath $chromePath -ArgumentList $htmlFilePath
    Write-Host "Opened index.html in Google Chrome."
} else {
    Write-Host "Google Chrome is not installed or path to Chrome is incorrect."
}
