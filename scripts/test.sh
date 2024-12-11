#!/bin/bash

PROJECT_ROOT=$(dirname $(dirname "$(realpath "$0")"))
VENV_DIR="$PROJECT_ROOT/venv"
MAIN_SCRIPT="$PROJECT_ROOT/src/main.py"
SETUP_SCRIPT="$PROJECT_ROOT/scripts/setup.sh"
REQUIREMENTS_FILE="$PROJECT_ROOT/scripts/requirements.txt"

prompt_run_setup() {
    echo "Would you like to run setup file?[Y/n]"
    read -r response
    response=${response:-Y} # Default to 'Y' if no input is given

    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo "Running setup.sh..."
        bash "$SETUP_SCRIPT"
        if [ $? -ne 0 ]; then
            echo "Failed to run setup.sh. Please check for errors."
            exit 1
        fi
    else
        echo "Setup.sh will not be executed. Exiting."
        exit 1
    fi
}

# Function to check dependencies
check_dependencies() {
    echo "Checking if dependencies are installed..."
    local all_installed=true
    source "$VENV_DIR/bin/activate"

    while read -r package; do
        if [[ -z "$package" || "$package" =~ ^# ]]; then
            continue
        fi

        # Extract package name and version (if specified)
        package_name=$(echo "$package" | cut -d'=' -f1)
        installed_version=$(pip show "$package_name" | grep "^Version:" | awk '{print $2}')
        required_version=$(echo "$package" | grep -oP "(?<===).*")

        # Check if the package is installed
        if [[ -z "$installed_version" ]]; then
            echo "Missing dependency: $package"
            all_installed=false
        elif [[ -n "$required_version" && "$installed_version" != "$required_version" ]]; then
            echo "Version mismatch: $package_name (installed: $installed_version, required: $required_version)"
            all_installed=false
        fi
    done <"$REQUIREMENTS_FILE"

    if $all_installed; then
        return 0
    else
        echo "Some dependencies are missing or have version mismatches."
        return 1
    fi
}

test_application() {
    echo "Testing application setup and functionality..."
    echo "----------------------------------------------"

    # Check if virtual environment exists
    echo "Checking if virtual environment exists..."
    if [ -d "$PROJECT_ROOT/venv" ]; then
        echo "Virtual environment exists."
    else
        echo "ERROR: Virtual environment not found. Please create a virtual environment."
        prompt_run_setup
        test_application
        exit 1
    fi
    source "$VENV_DIR/bin/activate"

    # check_dependencies

    echo
    if ! check_dependencies; then
        prompt_run_setup
    else
        echo "Dependencies are in place. Proceeding with tests..."
    fi

    # Test server startup
    echo "Testing server startup..."
    python3 "$MAIN_SCRIPT" &
    SERVER_PID=$!
    sleep 5
    if ps -p $SERVER_PID >/dev/null; then
        echo "Server started successfully."
        kill $SERVER_PID
    else
        echo "ERROR: Server failed to start."
        exit 1
    fi

    echo "All tests passed successfully."
}

# check_files
# source "$VENV_DIR/bin/activate"
test_application
