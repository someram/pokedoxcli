$ErrorActionPreference = "Stop"

$Repo = "someram/pokedoxcli"
$Version = "v1.0.0"
$Binary = "pokedoxcli"

$Arch = if ([Environment]::Is64BitOperatingSystem) {
    if ($env:PROCESSOR_ARCHITECTURE -eq "ARM64") {
        "arm64"
    } else {
        "amd64"
    }
} else {
    Write-Error "32-bit Windows is not supported."
}

$File = "${Binary}-windows-${Arch}.exe"
$Url = "https://github.com/$Repo/releases/download/$Version/$File"

$InstallDir = "$env:LOCALAPPDATA\Pokedox"
$InstallPath = "$InstallDir\$Binary.exe"

Write-Host "Downloading PokeDox CLI..."

New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

Invoke-WebRequest -Uri $Url -OutFile $InstallPath

$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")

if ($UserPath -notlike "*$InstallDir*") {
    [Environment]::SetEnvironmentVariable(
        "Path",
        "$UserPath;$InstallDir",
        "User"
    )
}

Write-Host ""
Write-Host "PokeDox CLI installed successfully!"
Write-Host "Restart your terminal, then run: pokedoxcli"
