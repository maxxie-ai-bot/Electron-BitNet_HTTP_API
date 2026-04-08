Write-Host "Checking system dependencies for Electron-BitNet..." -ForegroundColor Cyan

# Check for Node.js
if (Get-Command node -ErrorAction SilentlyContinue) {
    Write-Host "[x] Node.js is installed." -ForegroundColor Green
} else {
    Write-Host "[!] Node.js is missing! Attempting to install via winget..." -ForegroundColor Yellow
    winget install -e --id OpenJS.NodeJS.LTS
    if ($?) {
        Write-Host "Node.js installed successfully. IMPORTANT: You must close this terminal, open a new one, and re-run this script for the new PATH to apply." -ForegroundColor Red
        exit
    } else {
        Write-Host "Failed to install Node.js automatically." -ForegroundColor Red
        Write-Host "How to fix this manually:" -ForegroundColor Yellow
        Write-Host "1. Go to https://nodejs.org/" -ForegroundColor Yellow
        Write-Host "2. Download the recommended LTS (Long Term Support) installer for Windows." -ForegroundColor Yellow
        Write-Host "3. Run the installer (make sure 'Add to PATH' is checked)." -ForegroundColor Yellow
        Write-Host "4. Restart your IDE/Terminal and run this setup script again." -ForegroundColor Yellow
        exit
    }
}

# Check for Python
if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "[x] Python is installed." -ForegroundColor Green
} else {
    Write-Host "[!] Python is missing! Python isn't strictly required to run the UI, but it is required to download and prepare BitNet models." -ForegroundColor Yellow
}

# Run npm install
Write-Host "Running npm install to grab project dependencies..." -ForegroundColor Cyan
npm install

Write-Host "Setup complete! You can now start the application with: npm run restart" -ForegroundColor Green
