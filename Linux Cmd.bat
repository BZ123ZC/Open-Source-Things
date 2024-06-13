@echo off
setlocal enabledelayedexpansion

rem Get console width
for /f "usebackq tokens=*" %%a in (`"mode con: cols=80 && for %%b in (.) do rem"`) do (
    set "width=%%a"
)

rem Calculate left padding for center alignment
set /a "padding=(%width% - 80) / 2"

rem Center-aligned title
echo %padding% | set /p=".%padding%Welcome to linux CMD (Linux Commands Emulator) made by logiclord fuck blaze!!!"
echo %padding% | set /p=".%padding%------------------------------------------------------------"
echo.

:menu
rem Center-aligned menu options
echo %padding% | set /p=".%padding%1. ls    - List directory contents"
echo %padding% | set /p=".%padding%2. pwd   - Print working directory"
echo %padding% | set /p=".%padding%3. mkdir - Make directory"
echo %padding% | set /p=".%padding%4. touch - Create a new file"
echo %padding% | set /p=".%padding%5. cat   - Display file contents"
echo %padding% | set /p=".%padding%6. cd    - Change directory"
echo %padding% | set /p=".%padding%7. rm    - Remove file or directory"
echo %padding% | set /p=".%padding%8. mv    - Move or rename file"
echo %padding% | set /p=".%padding%9. clear - Clear the screen"
echo %padding% | set /p=".%padding%10. echo - Print message"
echo %padding% | set /p=".%padding%11. find - Search for a string in files"
echo %padding% | set /p=".%padding%12. date - Display current date and time"
echo %padding% | set /p=".%padding%13. exit - Exit Simple CMD"
echo %padding% | set /p=".%padding%------------------------------------------------------------"
echo.

set /p choice="Enter your choice (1-13): "

if "%choice%"=="1" (
    call :ls
) else if "%choice%"=="2" (
    call :pwd
) else if "%choice%"=="3" (
    call :mkdir
) else if "%choice%"=="4" (
    call :touch
) else if "%choice%"=="5" (
    call :cat
) else if "%choice%"=="6" (
    call :cd
) else if "%choice%"=="7" (
    call :rm
) else if "%choice%"=="8" (
    call :mv
) else if "%choice%"=="9" (
    cls
) else if "%choice%"=="10" (
    call :echoMsg
) else if "%choice%"=="11" (
    call :findStr
) else if "%choice%"=="12" (
    call :showDateTime
) else if "%choice%"=="13" (
    exit
) else (
    echo Invalid choice. Please try again.
    pause
    goto menu
)

exit /b

:ls
dir
pause
goto menu

:pwd
echo Current directory: %CD%
pause
goto menu

:mkdir
set /p dirname="Enter directory name: "
mkdir %dirname%
echo Directory created successfully.
pause
goto menu

:touch
set /p filename="Enter file name: "
echo. > %filename%
echo File created successfully.
pause
goto menu

:cat
set /p file="Enter file name: "
type %file%
pause
goto menu

:cd
set /p dir="Enter directory path: "
cd /d %dir%
echo Directory changed successfully.
pause
goto menu

:rm
set /p item="Enter file or directory name to remove: "
if exist %item% (
    if "%item:~-1%"=="/" (
        rmdir /s /q %item%
    ) else (
        del /q %item%
    )
    echo %item% removed successfully.
) else (
    echo %item% not found.
)
pause
goto menu

:mv
set /p source="Enter source file or directory: "
set /p destination="Enter destination file or directory: "
move %source% %destination%
echo %source% moved/renamed to %destination%.
pause
goto menu

:echoMsg
set /p message="Enter message: "
echo %message%
pause
goto menu

:findStr
set /p searchString="Enter string to search: "
set /p searchDir="Enter directory to search in: "
findstr /s /i /m /c:"%searchString%" %searchDir%\*.*
pause
goto menu

:showDateTime
date /t
time /t
pause
goto menu
