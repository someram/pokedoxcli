$ErrorActionPreference = "Stop"

$Repo = "someram/pokedoxcli"
$Version = "v1.0.0"
$Binary = "pokedoxcli"

$Arch = if ($env:PROCESSOR_ARCHITECTURE -eq "ARM64") {
    "arm64"
} else {
    "amd64"
}

$File = "${Binary}-windows-${Arch}.exe"
$Url = "https://github.com/$Repo/releases/download/$Version/$File"

$InstallDir = "$env:LOCALAPPDATA\Pokedox"
$InstallPath = "$InstallDir\$Binary.exe"

Write-Host "Downloading PokeDox CLI..."

New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

Invoke-WebRequest -Uri $Url -OutFile $InstallPath

$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")

if (($UserPath -split ';') -notcontains $InstallDir) {
    $NewPath = if ([string]::IsNullOrEmpty($UserPath)) {
        $InstallDir
    } else {
        "$UserPath;$InstallDir"
    }

    [Environment]::SetEnvironmentVariable("Path", $NewPath, "User")
}

if (($env:Path -split ';') -notcontains $InstallDir) {
    $env:Path += ";$InstallDir"
}

Write-Host ""
Write-Host "PokeDox CLI installed successfully!"
Write-Host "Run: pokedoxcli"

