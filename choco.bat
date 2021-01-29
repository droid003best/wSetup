powershell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

SCHTASKS /CREATE /SC onlogon /TN "choco" /TR "%temp%\install.bat" /rl HIGHEST
SCHTASKS /RUN /TN "choco"
SCHTASKS /DELETE /TN "choco" /f
