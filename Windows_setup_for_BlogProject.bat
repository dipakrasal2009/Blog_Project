@echo off
setlocal enabledelayedexpansion

REM === Configuration ===
set REPO_URL=https://github.com/dipakrasal2009/Blog_Project.git
set REPO_DIR=Blog_Project

echo Checking Docker installation...

where docker >nul 2>nul
if %errorlevel% neq 0 (
    echo Docker not found! Please install Docker manually.
    echo Follow https://docs.docker.com/get-docker/ for installation.
    exit /b 1
) else (
    echo Docker is already installed.
)

echo Checking Git installation...

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo Git not found! Please install Git manually.
    echo Follow https://git-scm.com/downloads for installation.
    exit /b 1
) else (
    echo Git is already installed.
)

echo.
echo Cloning the repository...
if exist "%REPO_DIR%" (
    echo Repository folder already exists. Skipping clone.
) else (
    git clone %REPO_URL%
)

cd %REPO_DIR%

echo.
echo Building Docker image...
docker build -t blog_project_image .

echo.
echo Running Docker container...
docker run -d -p 8000:8000 --name blog_project blog_project_image

echo.
echo Done! The application should be running at http://localhost:8000
pause

