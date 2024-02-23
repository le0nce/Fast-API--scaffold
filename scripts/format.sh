if [ -d ".venv" ]; then
    echo "Activating venv"
    if [ -f "./.venv/Scripts/activate" ]; then
        source ./.venv/Scripts/activate
    elif [ -f "./.venv/bin/activate" ]; then
        source ./.venv/bin/activate
    fi
else
    echo "Virtual environment not found"
    exit 1
fi

if [ "$1" == "--check" ]; then
    echo "Checking code format"
    python -m black --check app tests
else
    echo "Formatting code"
    python -m isort .
    python -m black app tests
fi
