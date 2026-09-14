param (
    [Parameter(Mandatory = $true)]
    [string]$Day
)

# Normalize day string to day_XX
if ($Day -match '^(\d+)$') {
    $formattedDay = "day_" + $matches[1].PadLeft(2, '0')
} elseif ($Day -match '^day_?(\d+)$') {
    $formattedDay = "day_" + $matches[1].PadLeft(2, '0')
} else {
    $formattedDay = $Day
}

$videoPath = "assets/videos/$formattedDay.mp4"
$gifPath = "assets/demos/$formattedDay.gif"

if (-not (Test-Path $videoPath)) {
    Write-Host "Error: Video file '$videoPath' not found!" -ForegroundColor Red
    Write-Host "Please place your MP4 video at '$videoPath' first." -ForegroundColor Yellow
    exit 1
}

# Ensure assets/demos exists
if (-not (Test-Path "assets/demos")) {
    New-Item -ItemType Directory -Path "assets/demos" -Force | Out-Null
}

Write-Host "Converting '$videoPath' -> '$gifPath' using FFmpeg..." -ForegroundColor Cyan

# Refresh PATH to pick up ffmpeg
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

& ffmpeg -y -i $videoPath -vf "fps=12,scale=280:-1:flags=lanczos,split[s0][s1];[s0]palettegen=max_colors=96[p];[s1][p]paletteuse=dither=bayer:bayer_scale=3" $gifPath

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nSuccess! Demo GIF generated at: $gifPath" -ForegroundColor Green
    Write-Host "`nMarkdown table snippet for README.md:" -ForegroundColor Yellow
    Write-Host "--------------------------------------------------"
    Write-Host "| <a href=`"$videoPath`"><img src=`"$gifPath`" width=`"280`" /></a> |"
    Write-Host "--------------------------------------------------"
} else {
    Write-Host "Failed to generate GIF. Please verify FFmpeg is installed." -ForegroundColor Red
}
