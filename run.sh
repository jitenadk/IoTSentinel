#!/bin/bash

PROJECT_ROOT=$(dirname "$(realpath "$0")")
TEST_SCRIPT="$PROJECT_ROOT/scripts/test.sh"
INIT_SCRIPT="$PROJECT_ROOT/scripts/init.sh"

main() {
    case "$1" in
    test)
        echo "Running tests..."
        bash "$TEST_SCRIPT"
        ;;
    init)
        echo "Initializing application..."
        
        bash "$INIT_SCRIPT"
        ;;
    *)
        echo "Usage: $0 {test|init}"
        exit 1
        ;;
    esac
}

main "$@"
