from fastapi import FastAPI
app = FastAPI()
#GET
@app.get("/")
def inicio():
    return {"mensaje": "Pagina principal de pat o  ruta raiz"}
#POST
@app.post("/Saludar")
def Saludar(datos: dict):
    return{
        "mensaje": f"Hola {datos['nombre']} bienvenido a esta pagina"
    }
