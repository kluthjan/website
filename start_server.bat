@echo off
echo Starting Local Portfolio Server...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Python found. Starting SimpleHTTP Server on port 8000...
    python -m http.server 8000
    goto :eof
)

REM Fallback to npx serve if Python is not found
echo Python not found. Trying npx serve...
call npx --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Starting npx serve...
    npx serve
    goto :eof
)


REM Fallback to PowerShell (Built-in on Windows)
echo Python/Node not found. Trying PowerShell...
powershell -ExecutionPolicy Bypass -Command "& '%~dp0server.ps1'"
if %errorlevel% equ 0 goto :eof

echo.
echo Error: Could not start a server using Python, Node.js, or PowerShell.
echo Please install Python (https://www.python.org/) to run a local server.
echo.
pause
