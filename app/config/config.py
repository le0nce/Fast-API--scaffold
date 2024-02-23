import os
from dataclasses import dataclass
from pathlib import Path

from dotenv import load_dotenv

env_path = Path(".") / ".env"
load_dotenv(env_path)

@dataclass
class Settings:

    project_name: str = os.getenv("PROJECT_NAME")
    project_version: str = os.getenv("PROJECT_VERSION")


settings = Settings()