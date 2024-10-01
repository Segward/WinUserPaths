@echo off
setlocal enabledelayedexpansion

rem Query the user-specific Path variable from the registry and store it in userPath
for /f "tokens=2*" %%i in ('reg query "HKCU\Environment" /v Path 2^>nul') do (
    set "userPath=%%j"
)

echo --------------------------------------------

rem Echo each path in the userPath variable
for %%i in ("!userPath:;=";"!") do (
    if not "%%~i"=="" (
        echo %%~i
    )
)

echo --------------------------------------------

rem End the local environment changes
endlocal