@echo off
setlocal

set "INSTALL_DIR=%~dp0"
set "INSTALL_DIR=%INSTALL_DIR:~0,-1%"

echo Installing TrimVid...
echo.

REM Add this folder to the current user's PATH
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$dir = '%INSTALL_DIR%';" ^
 "$p = [Environment]::GetEnvironmentVariable('Path','User');" ^
 "$parts = @($p -split ';' | Where-Object { $_ -and $_ -ne $dir });" ^
 "[Environment]::SetEnvironmentVariable('Path', (($parts + $dir) -join ';'), 'User')"

REM Add Trim Video to the MP4 context menu
reg add "HKCU\Software\Classes\SystemFileAssociations\.mp4\shell\TrimVid" ^
 /ve /d "Trim Video" /f >nul

REM Add the command
reg add "HKCU\Software\Classes\SystemFileAssociations\.mp4\shell\TrimVid\command" ^
 /ve /d "\"C:\Windows\System32\cmd.exe\" /k trim \"%%1\"" /f >nul

echo.
echo ========================================
echo TrimVid installed successfully!
echo ========================================
echo.
echo Folder added to user PATH:
echo %INSTALL_DIR%
echo.
echo Restart CMD/PowerShell before testing.
echo.
pause