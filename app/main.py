from fastapi import FastAPI

from app.config.config import settings

# Create a FastAPI application instance with title and version from settings
app = FastAPI(title=settings.project_name, version=settings.project_version)


# Define a root endpoint to indicate the application's online status
@app.get("/version")
async def root():
    return {"msg": "online"}