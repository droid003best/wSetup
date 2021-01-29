powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/install.bat', '%Temp%\wSetup\install.bat') }"
SCHTASKS /CREATE /SC onlogon /TN "choco" /TR "%temp%\wSetup\install.bat" /rl HIGHEST
SCHTASKS /RUN /TN "choco"
SCHTASKS /DELETE /TN "choco" /f
