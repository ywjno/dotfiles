$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = Split-Path -Parent $PSScriptRoot
$ts = Get-Date -Format 'yyyyMMddHHmmss'
$homeConfig = Join-Path $HOME ".config"

function Backup-File {
  param(
    [Parameter(Mandatory = $true)][string]$Source,
    [Parameter(Mandatory = $true)][string]$BackupPath,
    [Parameter(Mandatory = $true)][string]$Timestamp
  )

  if (Test-Path -LiteralPath $BackupPath) {
    Move-Item -LiteralPath $BackupPath -Destination "$BackupPath.$Timestamp" -Force
  }
  if (Test-Path -LiteralPath $Source) {
    Copy-Item -LiteralPath $Source -Destination $BackupPath -Force
  }
}

New-Item -ItemType Directory -Force -Path `
  $homeConfig, `
  (Join-Path $homeConfig "lazygit"), `
  (Join-Path $homeConfig "mise"), `
  (Join-Path $homeConfig "sheldon") | Out-Null

Backup-File -Source (Join-Path $HOME ".gitconfig") -BackupPath (Join-Path $HOME ".gitconfig.prefile") -Timestamp $ts
Backup-File -Source (Join-Path $HOME ".config\lazygit\config.yml") -BackupPath (Join-Path $HOME ".config\lazygit\config.yml.prefile") -Timestamp $ts
Backup-File -Source (Join-Path $HOME ".config\mise\config.toml") -BackupPath (Join-Path $HOME ".config\mise\config.toml.prefile") -Timestamp $ts
Backup-File -Source (Join-Path $HOME ".config\sheldon\plugins.toml") -BackupPath (Join-Path $HOME ".config\sheldon\plugins.toml.prefile") -Timestamp $ts

Copy-Item -LiteralPath (Join-Path $repoRoot ".gitconfig") -Destination (Join-Path $HOME ".gitconfig") -Force
Copy-Item -LiteralPath (Join-Path $repoRoot ".config\lazygit\config.yml") -Destination (Join-Path $HOME ".config\lazygit\config.yml") -Force
Copy-Item -LiteralPath (Join-Path $repoRoot ".config\mise\config.toml") -Destination (Join-Path $HOME ".config\mise\config.toml") -Force
Copy-Item -LiteralPath (Join-Path $repoRoot ".config\sheldon\plugins.toml") -Destination (Join-Path $HOME ".config\sheldon\plugins.toml") -Force

Write-Host "Copied dotfiles config to $HOME (backups use .prefile and .$ts)."
