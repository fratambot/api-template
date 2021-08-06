import pytest
from fastapi.testclient import TestClient
from api.main import app

client = TestClient(app)

def test_read_root(disable_network_calls):
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "Hello World"}

def test_always_passes():
    assert True

@pytest.mark.xfail()
def test_always_fails():
    assert False

def test_uppercase():
    assert "loud noises".upper() == "LOUD NOISES"