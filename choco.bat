
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/choco.bat', '%Temp%\wSetup\install.bat') }"
SCHTASKS /CREATE /SC onlogon /TN "choco" /TR "%temp%\install.bat" /rl HIGHEST
SCHTASKS /RUN /TN "choco"
SCHTASKS /DELETE /TN "choco" /f
