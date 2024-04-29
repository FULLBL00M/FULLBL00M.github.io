# Define the root directory containing the audio files
$audioDir = "../media/audio"

# Get a list of all audio files in the directory and subdirectories
$audioFiles = Get-ChildItem -Path $audioDir -Recurse -File

# Iterate through each audio file
foreach ($file in $audioFiles) {
    # Extract artist name, album name, and file name from the file path
    $artistAlbumFileName = $file.Directory.Name
    $artistName, $albumName = $artistAlbumFileName -split ' - '
    $fileName = $file.Name

    # Construct the audio URL
    $encodedArtist = [uri]::EscapeDataString($artistName)
    $encodedAlbum = [uri]::EscapeDataString($albumName)
    $encodedFileName = [uri]::EscapeDataString($fileName)
    $audioUrl = "./media/audio/$encodedArtist%20-%20$encodedAlbum/$encodedFileName"

    # Generate the simple-sampler component for the current audio file
    $output = "+simple-sampler({`n"
    $output += "    artist_name: `"$artistName`",`n"
    $output += "    album_name: `"$albumName`",`n"
    $output += "    file_name: `"$fileName`",`n"
    $output += "    audio_url: `"$audioUrl`"`n"
    $output += "})`n"

    # Output the generated component
    Write-Output $output
}
