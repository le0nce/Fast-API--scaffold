if [ -d ".venv" ]; then
    echo "Activating venv"
    if [ -f "./.venv/Scripts/activate" ]; then
        source ./.venv/Scripts/activate
    elif [ -f "./.venv/bin/activate" ]; then
        source ./.venv/bin/activate
    fi
fi

echo "Linting..."
python -m pylint --recursive=y ./app ./tests --ignore .venv --ignore .env

exit_status=$?
echo $exit_status

if [ $(($exit_status & 1)) -ne 0 ]; then
    echo "Fatal message issued by pylint (see prefixed with F)"
    exit 1
fi
if [ $(($exit_status & 2)) -ne 0 ]; then
    echo "Error message issued by pylint (see prefixed with E)"
    exit 1
fi
if [ $(($exit_status & 4)) -ne 0 ]; then
    echo "Warning message issued by pylint"
    exit 0
fi