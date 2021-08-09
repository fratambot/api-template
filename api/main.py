from fastapi import FastAPI

# custom modules
from models.algebra import array
from models.datawiz import transformations as t

# a =  array.get_random()
# print("array here = ", a.tolist())
# print("json array = ", t.ndarray_to_json(a))

app = FastAPI()


@app.get("/")
def read_root():
    return {"msg": "Hello World"}

@app.get("/array")
def get_array():
    return {t.ndarray_to_json(array.get_random())}