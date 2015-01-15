@echo off
::Ap7 - 15.01.2015 - Fast change audio output by means of SINGLE shortcut DefSound.exe. More details in the readme.txt
SetLocal EnableExtensions EnableDelayedExpansion
::Load number last changed audio card
@set /p CURRENT=< toggled-to
::Roles from DefSound.exe
:: ALL - all - все
::  CON - system notification and voice commands
::  MMEDIA - multimedia
::  VOICE - voice communications
@set ROLE=CON
@set ITER=-1
@for /f "tokens=*" %%I in (devices.txt) do @(
    set /A ITER+=1
    if not "%CURRENT%"=="!ITER!" (
        ::Change output!
        DefSound.exe "%%I" %ROLE%
        @echo !ITER!> toggled-to
    )
)