import pytest
from httpx import AsyncClient

from app import main


@pytest.fixture
def client() -> AsyncClient:
    test_client = AsyncClient(app=main.app, base_url="http://test")
    # Do dependency injection here
    return test_client
