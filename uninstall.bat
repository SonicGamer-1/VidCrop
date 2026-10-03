@echo off
setlocal

set "INSTALL_DIR=%~dp0"
set "INSTALL_DIR=%INSTALL_DIR:~0,-1%"

echo Uninstalling TrimVid...
echo.

REM Remove Trim Video from the MP4 context menu
reg delete "HKCU\Software\Classes\SystemFileAssociations\.mp4\shell\TrimVid" /f >nul 2>&1

REM Remove this folder from the current user's PATH
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$dir = '%INSTALL_DIR%';" ^
 "$p = [Environment]::GetEnvironmentVariable('Path','User');" ^
 "if ($p) {" ^
 "  $parts = @($p -split ';' | Where-Object { $_ -and $_ -ne $dir });" ^
 "  [Environment]::SetEnvironmentVariable('Path', ($parts -join ';'), 'User')" ^
 "}"

echo.
echo ========================================
echo TrimVid uninstalled successfully!
echo ========================================
echo.
echo Removed:
echo - MP4 context-menu entry
echo - TrimVid folder from user PATH
echo.
echo Restart CMD/PowerShell and Explorer.
echo.
pause