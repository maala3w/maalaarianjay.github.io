@echo off
rem Double-click to open the portfolio editor. Close this window when you are finished.
cd /d "%~dp0"
title Portfolio Editor - keep this window open while editing
echo Starting your portfolio on this computer...
echo Keep this window open while you edit. Close it when you are finished.
echo.
start "" /b python -m http.server 5500 --directory public

rem Wait for the server, so the browser doesn't open to a "can't connect" page.
set tries=0
:wait
curl -s -o nul http://localhost:5500/editor.html && goto open
set /a tries+=1
if %tries% geq 30 goto failed
timeout /t 1 /nobreak >nul
goto wait

:open
start "" msedge "http://localhost:5500/editor.html"
goto :eof

:failed
echo.
echo The local server did not start. Please check that Python is installed.
pause
