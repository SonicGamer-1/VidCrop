@echo off
setlocal

if "%~1"=="" goto usage

set "INPUT=%~1"
if not exist "%INPUT%" (
    echo Error: "%INPUT%" was not found.
    exit /b 1
)

if "%~2"=="" goto prompt_times
if "%~3"=="" (
    echo Usage: trim.bat "video-file" start-time end-time
    exit /b 1
)
if not "%~4"=="" (
    echo Usage: trim.bat "video-file" start-time end-time
    exit /b 1
)
set "START=%~2"
set "END=%~3"
goto trim

:prompt_times
set /p "START=Start time: "
if not defined START (
    echo Error: Start time cannot be empty.
    exit /b 1
)
set /p "END=End time: "
if not defined END (
    echo Error: End time cannot be empty.
    exit /b 1
)

:trim
where ffmpeg >nul 2>nul
if errorlevel 1 (
    echo Error: FFmpeg is not installed or not found in PATH.
    exit /b 1
)

set "OUTPUT=%~dpn1_trimmed.mp4"
echo Trimming video...
ffmpeg -ss "%START%" -to "%END%" -i "%INPUT%" -c copy -y "%OUTPUT%"
if errorlevel 1 (
    echo Error: FFmpeg could not trim the video.
    exit /b 1
)

echo Success: "%OUTPUT%"
exit /b 0

:usage
echo Usage: trim.bat "video-file.mp4" start-time end-time
echo Example: trim.bat "input.mp4" 00:00:10 00:00:20
exit /b 1
