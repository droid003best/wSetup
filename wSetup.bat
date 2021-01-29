if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
  echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
)
:eof
@echo off

cls
echo Wird heruntergeladen; choco.bat
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/choco.bat', '%Temp%\wSetup\Installation\choco.bat') }" > %Temp%\wSetup\Log\wSetup.txt
echo Wird heruntergeladen; deactivate.bat
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/deactivate.bat', '%Temp%\wSetup\Installation\deactivate.bat') }" > %Temp%\wSetup\Log\wSetup.txt
echo Wird heruntergeladen; uninstall.bat
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/uninstall.bat', '%Temp%\wSetup\Installation\uninstall.bat') }" > %Temp%\wSetup\Log\wSetup.txt
