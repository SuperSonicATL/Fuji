#!/usr/bin/env bash
set -euo pipefail

echo "========================================="
echo "  Building Fuji for Apple Mac (macOS)"
echo "========================================="

if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "Error: This script must be executed on a macOS system." >&2
    exit 1
fi

if [[ ! -d ".venv" ]]; then
    echo "Creating Python virtual environment (.venv)..."
    python3 -m venv .venv
fi

echo "Activating virtual environment..."
source .venv/bin/activate

echo "Installing/updating dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Running PyInstaller with Fuji.spec..."
pyinstaller --noconfirm Fuji.spec

echo "========================================="
echo "Build succeeded!"
echo "Generated DMG:"
ls -lh dist/*.dmg
echo "Generated App Bundle:"
ls -ld dist/Fuji.app
echo "========================================="
