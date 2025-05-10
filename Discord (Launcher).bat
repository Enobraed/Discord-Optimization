@echo off
taskkill /f /im "Discord.exe" >nul 2>&1
setlocal enabledelayedexpansion
set "dir-app=%USERPROFILE%\AppData\Local\Discord"
set "dir-app2=%USERPROFILE%\AppData\Roaming\discord"

del /S *.log >nul 2>&1
for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d" >nul 2>&1
for /r "%~dp0" %%i in (*) do if %%~zi==0 del "%%i" >nul 2>&1

for %%D in (
    Cache
    component_crx_cache
    DawnGraphiteCache
    DawnWebGPUCache
    GPUCache
) do (
    rd /s /q "%dir-app2%\%%D" >nul 2>&1
)
rd /s /q "%dir-app2%\Code Cache" >nul 2>&1

for /d %%D in ("%dir-app%\app-*") do (
    if exist "%%D\Discord.exe" (
        start "" "%%D\Discord.exe" --ProcessStart Discord.exe --disable-animations --disable-extensions --disable-logging --disable-software-rasterizer --disable-updater --disable-web-security --enable-gpu-rasterization --enable-zero-copy --ignore-gpu-blocklist --no-sandbox
        endlocal
        exit /b
    )
)