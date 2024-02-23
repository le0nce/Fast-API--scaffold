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

echo "Installing RUNTIME AND DEV python packages"

python -m pip install -r ./requirements.txt
python -m pip install -r ./requirements-dev.txt