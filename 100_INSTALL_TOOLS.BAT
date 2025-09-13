@echo off

echo Installing GIT...
winget install --id Git.Git -e --source winget
git --version
echo.

echo Installing Tortoise GIT
winget install -e --id TortoiseGit.TortoiseGit
echo.

echo Installing Notepad++...
winget install -e --id Notepad++.Notepad++
echo. 

echo Installing Visual Studio Code...
winget install --id Microsoft.VisualStudioCode -e --override "/VERYSILENT /SP- /MERGETASKS=\"!runcode,!desktopicon,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath\""
code --install-extension ms-python.python
echo.

:: Restart windows explorer
echo Restarting Windows Explorer...
::taskkill /f /im explorer.exe
::start explorer.exe
echo Windows Explorer restarted.
echo.


:: Pause at end of script
pause