from fastapi import FastAPI
app = FastAPI()
@app.get("/")
def inicio():
    return {"mensaje": "Hola esta es mi api att Patricio"}