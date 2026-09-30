@echo off
TITLE PocketSmart AI - Application Launcher
COLOR 0A

echo ===================================================
echo           Starting PocketSmart AI Application      
echo ===================================================
echo.

:: Step 1: Check if virtual environment exists, create if missing
if not exist "venv\Scripts\activate.bat" (
    echo [INFO] Virtual environment not found. Creating venv...
    python -m venv venv
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to create virtual environment. Make sure Python 3 is installed and added to PATH.
        pause
        exit /b %errorlevel%
    )
    echo [SUCCESS] Virtual environment created.
    echo.
)

:: Step 2: Activate Virtual Environment
echo [INFO] Activating virtual environment...
call venv\Scripts\activate.bat

:: Step 3: Check and Install Requirements
if exist "requirements.txt" (
    echo [INFO] Checking and installing dependencies from requirements.txt...
    pip install -r requirements.txt
    if %errorlevel% neq 0 (
        echo [WARNING] Dependency installation encountered issues. Attempting to continue...
    )
) else (
    echo [WARNING] requirements.txt not found! Skipping dependency installation.
)

echo.
:: Step 4: Verify .env configuration
if not exist ".env" (
    echo [WARNING] .env file not found! Please make sure GOOGLE_API_KEY is configured.
    echo.
)

:: Step 5: Start the Application with Uvicorn / Python
echo ===================================================
echo  Server is starting on http://127.0.0.1:8000
echo  Press Ctrl+C to stop the server.
echo ===================================================
echo.

python app.py

pause