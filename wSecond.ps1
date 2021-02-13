if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
  echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
)
:eof
mkdir %temp%\wSetup\
@echo off
title Configuring...
mode con: cols=90 lines=6
color f0


powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/theme.deskthemepack', '%Temp%\wSetup\theme.deskthemepack') }"
start /min %Temp%\wSetup\theme.deskthemepack


title Wird heruntergeladen; choco.bat
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/choco.bat', '%Temp%\wSetup\choco.bat') }"
title Wird gestartet; choco.bat
start /min %Temp%\wSetup\choco.bat

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t  REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowCortanaButton /T REG_DWORD /D 0 /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MultiTaskingView\AllUpView" /V Enabled /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowTaskViewButton /T REG_DWORD /D 0 /F


title Taskbar wird eingestellt...
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/droid003best/wSetup/main/TaskBar/Taskbar.reg', '%temp%\wSetup\taskbar.reg') }"
%windir%\system32\reg.exe import %temp%\wSetup\taskbar.reg

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "C:\Users\janis\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Google Chrome.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Program Files\Google\Chrome\Application\chrome.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "C:\Users\janis\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\FileZilla.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Program Files\FileZilla FTP Client\FileZilla.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "C:\Users\janis\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\VLC media player.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Program Files\VideoLAN\VLC\vlc.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "C:\Users\janis\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\WinRAR.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Program Files\WinRAR\WinRAR.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "C:\Users\janis\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\File Explorer.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Windows\Explorer.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs

title Einstellungen werden beendet...
taskkill /F /IM systemsettings.exe

title Windows wird aktiviert... []-
slmgr /skms kms8.msguides.com //b
title Windows wird aktiviert... [][]
slmgr /ato //b

CLS
title Disable Windows Featues... (Step 2/12) [][]----------
dism /online /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64 /NoRestart
CLS
title Disable Windows Featues... (Step 3/12) [][][]---------
dism /Online /Disable-Feature /FeatureName:"Printing-Foundation-Features" /NoRestart
CLS
title Disable Windows Featues... (Step 4/12) [][][][]--------
dism /Online /Disable-Feature /FeatureName:"Printing-Foundation-LPDPrintService" /NoRestart
CLS
title Disable Windows Featues... (Step 5/12) [][][][][]-------
dism /Online /Disable-Feature /FeatureName:"Printing-Foundation-LPRPortMonitor" /NoRestart
CLS
title Disable Windows Featues... (Step 6/12) [][][][][][]------
dism /Online /Disable-Feature /FeatureName:"Printing-PrintToPDFServices-Features" /NoRestart
CLS
title Disable Windows Featues... (Step 7/12) [][][][][][][]-----
dism /Online /Disable-Feature /FeatureName:"Printing-XPSServices-Features" /NoRestart
CLS
title Disable Windows Featues... (Step 9/12) [][][][][][][][][]---
dism /Online /Disable-Feature /FeatureName:"TelnetClient" /NoRestart
CLS
title Disable Windows Featues... (Step 10/12)[][][][][][][][][][]--
dism /Online /Disable-Feature /FeatureName:"TFTP" /NoRestart
CLS
title Disable Windows Featues... (Step 11/12)[][][][][][][][][][][]-
dism /Online /Disable-Feature /FeatureName:"TIFFIFilter" /NoRestart
CLS
title Disable Windows Featues... (Step 12/12)[][][][][][][][][][][][]
dism /Online /Disable-Feature /FeatureName:"WindowsMediaPlayer" /NoRestart
CLS

title Services deaktivieren...
  sc stop DiagTrack
	sc stop diagnosticshub.standardcollector.service
	sc stop dmwappushservice
	sc stop WMPNetworkSvc
	sc stop WSearch
	sc config DiagTrack start= disabled
	sc config diagnosticshub.standardcollector.service start= disabled
	sc config dmwappushservice start= disabled
	sc config RemoteRegistry start= disabled
	sc config TrkWks start= disabled
	sc config WMPNetworkSvc start= disabled
	sc config WSearch start= disabled
	sc config SysMain start= disabled
	
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowCortanaButton /T REG_DWORD /D 0 /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MultiTaskingView\AllUpView" /V Enabled /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowTaskViewButton /T REG_DWORD /D 0 /F

title OneDrive deinstallieren...
taskkill /f /im OneDrive.exe
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
%SystemRoot%\System32\OneDriveSetup.exe /uninstall
rd “%UserProfile%\OneDrive” /Q /S
rd “%LocalAppData%\Microsoft\OneDrive” /Q /S
rd “%ProgramData%\Microsoft OneDrive” /Q /S
rd “C:\OneDriveTemp” /Q /S

powershell -command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"

title Deinstalling Bloatware...  (Step 1/31) []------------------------------
	PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 2/31) [][]-----------------------------
	PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 5/31) [][][][][]--------------------------
	PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 6/31) [][][][][][]-------------------------
	PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 8/31) [][][][][][][][]-----------------------
	PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 9/31) [][][][][][][][][]----------------------
	PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 11/31)[][][][][][][][][][][]--------------------
	PowerShell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 16/31)[][][][][][][][][][][][][][][][]---------------
	PowerShell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 20/31)[][][][][][][][][][][][][][][][][][][][]-----------
	PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
CLS
title Deinstalling Bloatware...  (Step 23/31)[][][][][][][][][][][][][][][][][][][][][][][]--------
	PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage"

title Deinstalling Bloatware...  (Step 24/31)[][][][][][][][][][][][][][][][][][][][][][][][]-------
taskkill /IM Cortana.exe /F
	PowerShell -Command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"

title Deinstalling Bloatware...  (Step 27/31)[][][][][][][][][][][][][][][][][][][][][][][][][][][]----
	PowerShell -Command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"

title Deinstalling Bloatware...  (Step 28/31)[][][][][][][][][][][][][][][][][][][][][][][][][][][][]---
	PowerShell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"

title Deinstalling Bloatware...  (Step 29/31)[][][][][][][][][][][][][][][][][][][][][][][][][][][][][]--
	PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"

title Deinstalling Bloatware...  (Step 30/31)[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]-
	PowerShell -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"

title Deinstalling Bloatware...  (Step 31/31)[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
	PowerShell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
exit




