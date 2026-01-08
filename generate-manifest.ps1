$ErrorActionPreference = 'Stop'

Set-Location $PSScriptRoot

$extensions = @('*.png', '*.jpg', '*.jpeg', '*.webp', '*.gif', '*.svg')

$paths = Get-ChildItem -Recurse -File -Include $extensions |
  ForEach-Object { $_.FullName.Substring((Get-Location).Path.Length + 1).Replace('\\', '/') }

$paths | ConvertTo-Json | Set-Content -Encoding UTF8 "images.manifest.json"
Write-Host ("Wrote {0} paths to images.manifest.json" -f $paths.Count)
