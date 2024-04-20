# Define the URL to open in Google Chrome
$urlToOpen = "https://fullbl00m.github.io"

# Path to Google Chrome executable
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Check if Google Chrome is installed
if (Test-Path $chromePath) {
    # Open the specified URL in Google Chrome
    Start-Process -FilePath $chromePath -ArgumentList $urlToOpen
    Write-Host "Opened $urlToOpen in Google Chrome."
} else {
    Write-Host "Google Chrome is not installed or path to Chrome is incorrect."
}
