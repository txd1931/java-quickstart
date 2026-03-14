param(
	[int]$Port = 5005
)

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
Set-Location $repoRoot

if (-not (Test-Path '.\mvnw.cmd')) {
	throw "mvnw.cmd not found. Run this script from inside the repository."
}

$attachCommand = @"
Write-Host "Waiting for debugger target on port $Port ..."
while (`$true) {
	jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=$Port 2>`$null
	if (`$LASTEXITCODE -eq 0) {
		break
	}

	Write-Host "Target not ready yet. Retrying in 1 second ..."
	Start-Sleep -Seconds 1
}
"@

Start-Process -FilePath 'pwsh' -ArgumentList '-NoExit', '-Command', $attachCommand | Out-Null

& .\mvnw.cmd '-Pdebug' "-Ddebug.port=$Port" compile exec:exec
