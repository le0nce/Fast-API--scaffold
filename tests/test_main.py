import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_read_main(client: AsyncClient):

    response = await client.get("/version")

    assert response.status_code == 200
    assert response.json() == {"msg": "online"}
