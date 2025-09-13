@echo off

echo Local python version
python --version
if errorlevel 1 (
    echo Python is not installed. Please run 100_INSTALL_TOOLS.BAT first.
    pause
    exit /b 1
)
echo.

if not exist ./venv_win (
    echo Creating virtual environment...
    python -m venv --copies venv_win
    if errorlevel 1 (
        echo Failed to create virtual environment.
        pause
        exit /b 1
    )
    echo Virtual environment created.
) else (
    echo Virtual environment already exists.
)
echo.

.\venv_win\Scripts\python.exe -m pip install --trusted-host pypi.org ^
                                             --trusted-host pypi.python.org ^
                                             --trusted-host files.pythonhosted.org ^
                                             --upgrade pip wheel setuptools

.\venv_win\Scripts\python.exe -m pip install --trusted-host pypi.org ^
                                             --trusted-host pypi.python.org ^
                                             --trusted-host files.pythonhosted.org ^
                                             --upgrade ^
                                             ^
                                             requests ^
                                             XlsxWriter openpyxl pandas ^
                                             pylint pylint-json2html ^
                                             pytest pytest-cov


mkdir data 2>nul
.\venv_win\Scripts\pip freeze > .\data\requirements.txt
git add .\data\requirements.txt 2>nul

pause
goto :eof
