#!/bin/bash

# Paths
PROJECT_ROOT=$(dirname $(dirname "$(realpath "$0")"))
VENV_DIR="$PROJECT_ROOT/venv"
REQUIREMENTS_FILE="$PROJECT_ROOT/scripts/requirements.txt"

# Create virtual environment
setup_venv() {
    echo "Checking virtual environment..."
    if [ ! -d "$VENV_DIR" ]; then
        echo "Creating virtual environment..."
        python3 -m venv "$VENV_DIR"
    else
        echo "Virtual environment already exists."
    fi
}

# Install dependencies
install_dependencies() {
    echo "Installing dependencies..."
    source "$VENV_DIR/bin/activate"
    if [ -f "$REQUIREMENTS_FILE" ]; then
        pip install --upgrade pip
        pip install -r "$REQUIREMENTS_FILE"
    else
        echo "ERROR: requirements.txt not found at $REQUIREMENTS_FILE."
        exit 1
    fi
}

# Main function
main() {
    setup_venv
    install_dependencies
    echo "Setup completed successfully."
}

main
