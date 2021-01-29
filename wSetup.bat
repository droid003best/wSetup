if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
  echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
)
:eof
mkdir %temp%\wSetup\
mkdir %temp%\wSetup\Installation\
mkdir %temp%\wSetup\Log\
@echo off



cls
echo Wird heruntergeladen; choco.bat
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/choco.bat', '%Temp%\wSetup\Installation\choco.bat') }" > %Temp%\wSetup\Log\wSetup.txt
echo Wird heruntergeladen; deactivate.bat
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/deactivate.bat', '%Temp%\wSetup\Installation\deactivate.bat') }" > %Temp%\wSetup\Log\wSetup.txt
echo Wird heruntergeladen; uninstall.bat
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/uninstall.bat', '%Temp%\wSetup\Installation\uninstall.bat') }" > %Temp%\wSetup\Log\wSetup.txt
echo Wird heruntergeladen; extras.bat
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/extras.bat', '%Temp%\wSetup\Installation\extras.bat') }" > %Temp%\wSetup\Log\wSetup.txt

cls
Wird gestartet; choco.bat
start %Temp%\wSetup\Installation\choco.bat > %Temp%\wSetup\Log\choco.txt
Wird gestartet; deactivate.bat
start %Temp%\wSetup\Installation\deactivate.bat > %Temp%\wSetup\Log\deactivate.txt
Wird gestartet; uninstall.bat
start %Temp%\wSetup\Installation\uninstall.bat > %Temp%\wSetup\Log\uninstall.txt
Wird gestartet; extras.bat
start %Temp%\wSetup\Installation\extras.bat > %Temp%\wSetup\Log\extras.txt

