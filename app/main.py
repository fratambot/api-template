from fastapi import FastAPI

# custom modules
from models.algebra import array

app = FastAPI()


@app.get("/")
def read_root():
    return {"msg": "Hello Universe !"}


@app.get("/array")
def get_array():
    return {"result": array.get_random().tolist()}
