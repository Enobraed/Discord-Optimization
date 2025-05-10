@echo off
taskkill /f /im "Discord.exe" >nul 2>&1
setlocal enabledelayedexpansion

set "sourceFolder=%USERPROFILE%\AppData\Local\Discord"
set "backupFolder=%cd%\.backup"
set "latestVersion="
set "latestFolder="

mkdir "!backupFolder!" > nul 2>&1

for /d %%d in ("!sourceFolder!\app-*") do (
    set "folderName=%%~nxd"
    set "version=!folderName:app-=!"
    
    if "!latestVersion!"=="" (
        set "latestVersion=!version!"
        set "latestFolder=%%d"
    ) else (
        if "!version!" GTR "!latestVersion!" (
            set "latestVersion=!version!"
            set "latestFolder=%%d"
        )
    )
)

if defined latestFolder (
    set "targetFolder=!backupFolder!\app-!latestVersion!"

    :: Creating backup folders (necessary for mkdir to work as well)
    mkdir "!targetFolder!" >nul 2>&1
    mkdir "!targetFolder!\locales" >nul 2>&1
    mkdir "!targetFolder!\modules\discord_desktop_core-1\discord_desktop_core" >nul 2>&1
    mkdir "!targetFolder!\modules\discord_media-1" >nul 2>&1
    mkdir "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules" >nul 2>&1
    mkdir "!targetFolder!\modules\discord_voice-1\discord_voice" >nul 2>&1

    :: Moving noise suppression by KRISP
    move "!latestFolder!\modules\discord_krisp" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_krisp-1" "!targetFolder!\modules" >nul 2>&1

    :: Moving Vulkan
    move "!latestFolder!\vulkan-1.dll" "!targetFolder!" >nul 2>&1

    :: Moving the chrome_*.pak files (if using Better Discord - delete the line.
    move "!latestFolder!\chrome_*.pak" "!targetFolder!" >nul 2>&1

    :: Moving game activity (Games from Discord)
    move "!latestFolder!\Microsoft.Gaming.XboxApp.XboxNetwork.winmd" "!targetFolder!" >nul 2>&1
    move "!latestFolder!\modules\discord_game_utils" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_game_utils-1" "!targetFolder!\modules" >nul 2>&1

    :: Moving overlay
    move "!latestFolder!\modules\discord_desktop_overlay-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_hook-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_overlay2-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_overlay2-2" "!targetFolder!\modules" >nul 2>&1
	
    :: Moving notifications
    move "!latestFolder!\modules\discord_notifications-1" "!targetFolder!\modules" >nul 2>&1

    :: Moving unnecessary submodules in the voice module
    move "!latestFolder!\modules\discord_voice-1\discord_voice\gpu_encoder_helper.exe" "!targetFolder!\modules\discord_voice-1\discord_voice" >nul 2>&1
    move "!latestFolder!\modules\discord_voice-1\discord_voice\node_modules" "!targetFolder!\modules\discord_voice-1\discord_voice" >nul 2>&1
    move "!latestFolder!\modules\discord_voice-1\discord_voice\selfie_segmentation.tflite" "!targetFolder!\modules\discord_voice-1\discord_voice" >nul 2>&1
    move "!latestFolder!\modules\discord_voice-1\discord_voice\selfie_segmentation_landscape.tflite" "!targetFolder!\modules\discord_voice-1\discord_voice" >nul 2>&1

    :: Moving unnecessary modules
    move "!latestFolder!\modules\discord_cloudsync-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_dispatch-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_erlpack-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_modules-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_rpc-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_spellcheck-1" "!targetFolder!\modules" >nul 2>&1
    move "!latestFolder!\modules\discord_zstd-1" "!targetFolder!\modules" >nul 2>&1

    :: Moving various junk files
    move "!latestFolder!\app.ico" "!targetFolder!" >nul 2>&1
    move "!latestFolder!\d3dcompiler_47.dll" "!targetFolder!" >nul 2>&1
    move "!latestFolder!\Discord.exe.sig" "!targetFolder!" >nul 2>&1
    move "!latestFolder!\libEGL.dll" "!targetFolder!" >nul 2>&1
    move "!latestFolder!\libGLESv2.dll" "!targetFolder!" >nul 2>&1
    move "!latestFolder!\modules\discord_desktop_core-1\discord_desktop_core\package.json" "!targetFolder!\modules\discord_desktop_core-1\discord_desktop_core" >nul 2>&1
    move "!latestFolder!\modules\discord_media-1\discord_media\manifest.json" "!targetFolder!\modules\discord_media-1\discord_media" >nul 2>&1
    move "!latestFolder!\modules\discord_media-1\discord_media\package.json" "!targetFolder!\modules\discord_media-1\discord_media" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\manifest.json" "!targetFolder!\modules\discord_utils-1\discord_utils" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\bindings\LICENSE.md" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\bindings" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\bindings\README.md" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\bindings" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path\.npmignore" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path\History.md" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path\LICENSE" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path\package.json" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path\README.md" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\file-uri-to-path" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\node-addon-api" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\windows-notification-state\LICENSE" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\windows-notification-state" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\node_modules\windows-notification-state\README.md" "!targetFolder!\modules\discord_utils-1\discord_utils\node_modules\windows-notification-state" >nul 2>&1
    move "!latestFolder!\modules\discord_utils-1\discord_utils\package.json" "!targetFolder!\modules\discord_utils-1\discord_utils" >nul 2>&1
    move "!latestFolder!\modules\discord_voice-1\discord_voice\manifest.json" "!targetFolder!\modules\discord_voice-1\discord_voice" >nul 2>&1
    move "!latestFolder!\modules\discord_voice-1\discord_voice\package.json" "!targetFolder!\modules\discord_voice-1\discord_voice" >nul 2>&1
    move "!latestFolder!\resources\manifest.json" "!targetFolder!\resources" >nul 2>&1
    move "!latestFolder!\snapshot_blob.bin" "!targetFolder!" >nul 2>&1
    move "!latestFolder!\vk_swiftshader.dll" "!targetFolder!" >nul 2>&1
    move "!latestFolder!\vk_swiftshader_icd.json" "!targetFolder!" >nul 2>&1
    move "%USERPROFILE%\AppData\Local\Discord\packages" "%USERPROFILE%\AppData\Local\Discord\.backup" >nul 2>&1
    for %%l in (a b c d en-GB es el et f g h i j k l m n o r p q s t u v w x y z) do (
        move /y "!latestFolder!\locales\%%l*.pak" "!targetFolder!\locales" >nul 2>&1
    )

    :: Moving Update Discord
    move "%USERPROFILE%\AppData\Local\Discord\Update.exe" "%USERPROFILE%\AppData\Local\Discord\.backup" >nul 2>&1
)

for /d %%d in ("!sourceFolder!\app-*") do (
    set "folderName=%%~nxd"
    if "!folderName:app-=!" LSS "!latestVersion!" (
        rmdir /s /q "%%d" > nul 2>&1
    )
)

for /d %%d in ("!backupFolder!\app-*") do (
    set "folderName=%%~nxd"
    if "!folderName:app-=!" LSS "!latestVersion!" (
        rmdir /s /q "%%d" > nul 2>&1
    )
)

for /f "delims=" %%d in ('dir /ad/b/s ^| sort /r') do rd "%%d" >nul 2>&1
for /r "%~dp0" %%f in (*) do if %%~zf==0 del "%%f" >nul 2>&1
del /S *.log >nul 2>&1

endlocal

pause
exit