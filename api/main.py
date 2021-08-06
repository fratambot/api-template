from fastapi import FastAPI
#from models.algebra import array

#print("array here = ", array.get_random())


app = FastAPI()


@app.get("/")
def read_root():
    return {"msg": "Hello World"}
