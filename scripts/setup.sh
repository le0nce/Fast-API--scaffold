if [ -d ".venv" ]; then
    echo "venv already installed"
else
    echo "Installing venv"
    python -m venv .venv
    
    if [ $? -ne 0 ]; then
        echo "Cannot create venv"
        exit 1
    fi
fi

if [ -d ".venv" ]; then
    echo "Activating venv"
    if [ -f "./.venv/Scripts/activate" ]; then
        source ./.venv/Scripts/activate
    elif [ -f "./.venv/bin/activate" ]; then
        source ./.venv/bin/activate
    fi
    if [ $? -ne 0 ]; then
        echo "Python sources cannot be activated"
        exit 1
    fi
fi