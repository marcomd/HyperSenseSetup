@echo off
REM HyperSense Setup Script for Windows
REM This script clones the backend and frontend repositories

echo ===================================
echo   HyperSense Setup
echo ===================================
echo.

REM Clone backend
if exist "backend" (
    echo [!] backend folder already exists, skipping...
) else (
    echo [1/2] Cloning backend (HyperSense)...
    git clone https://github.com/marcomd/HyperSense.git backend
    if errorlevel 1 goto :error
)

REM Clone frontend
if exist "frontend" (
    echo [!] frontend folder already exists, skipping...
) else (
    echo [2/2] Cloning frontend (HyperSenseDashboard)...
    git clone https://github.com/marcomd/HyperSenseDashboard.git frontend
    if errorlevel 1 goto :error
)

REM Create .env if it doesn't exist
if not exist ".env" (
    echo.
    echo [*] Creating .env from template...
    copy .env.docker.example .env
    echo [!] Please edit .env with your configuration
) else (
    echo.
    echo [!] .env already exists, skipping...
)

echo.
echo ===================================
echo   Setup Complete!
echo ===================================
echo.
echo Next steps:
echo   1. Edit .env with your configuration:
echo      - RAILS_MASTER_KEY (from backend\config\master.key)
echo      - POSTGRES_PASSWORD
echo      - LLM_PROVIDER and API key
echo.
echo   2. Start the application:
echo      docker compose up -d --build
echo.
echo   3. Access the dashboard:
echo      http://localhost
echo.
goto :end

:error
echo.
echo [ERROR] Setup failed. Please check the error above.
exit /b 1

:end
