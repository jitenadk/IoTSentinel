#!/bin/bash

PROJECT_ROOT=$(dirname $(dirname "$(realpath "$0")"))
VENV_DIR="$PROJECT_ROOT/venv"
MAIN_SCRIPT="$PROJECT_ROOT/src/main.py"

initialize_application() {
    echo "Initializing application..."
    source "$VENV_DIR/bin/activate"
    python3 "$MAIN_SCRIPT"
}

initialize_application
