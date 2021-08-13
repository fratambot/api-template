from fastapi import FastAPI

# custom modules
from models.algebra import array
from models.datawiz import transformations as t

app = FastAPI()


@app.get("/")
def read_root():
    return {"msg": "Hello Universe !"}


@app.get("/array")
def get_array():
    return {t.ndarray_to_json(array.get_random())}
