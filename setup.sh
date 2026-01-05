#!/bin/bash
# HyperSense Setup Script
# This script clones the backend and frontend repositories

set -e

echo "==================================="
echo "  HyperSense Setup"
echo "==================================="
echo ""

# Clone backend
if [ -d "backend" ]; then
    echo "[!] backend folder already exists, skipping..."
else
    echo "[1/2] Cloning backend (HyperSense)..."
    git clone https://github.com/marcomd/HyperSense.git backend
fi

# Clone frontend
if [ -d "frontend" ]; then
    echo "[!] frontend folder already exists, skipping..."
else
    echo "[2/2] Cloning frontend (HyperSenseDashboard)..."
    git clone https://github.com/marcomd/HyperSenseDashboard.git frontend
fi

# Create .env if it doesn't exist
if [ ! -f ".env" ]; then
    echo ""
    echo "[*] Creating .env from template..."
    cp .env.docker.example .env
    echo "[!] Please edit .env with your configuration"
else
    echo ""
    echo "[!] .env already exists, skipping..."
fi

echo ""
echo "==================================="
echo "  Setup Complete!"
echo "==================================="
echo ""
echo "Next steps:"
echo "  1. Edit .env with your configuration:"
echo "     - RAILS_MASTER_KEY (from backend/config/master.key)"
echo "     - POSTGRES_PASSWORD"
echo "     - LLM_PROVIDER and API key"
echo ""
echo "  2. Start the application:"
echo "     docker compose up -d --build"
echo ""
echo "  3. Access the dashboard:"
echo "     http://localhost"
echo ""
