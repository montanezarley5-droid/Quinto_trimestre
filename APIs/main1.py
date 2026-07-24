#pip install fastapi
#pip install uvicorn
#python -m pip install "uvicorn[standart]"
#python -m install uvicorn --verbose
#python -m uvicorn main:app --reload

#Generar la url para verificar la url
#uvicorn mmain app --reload

#Importar la clase fastAPI desde el paquete fastAPI
#Es el motor para crear las api WEB

from fastapi import FastAPI
app = FastAPI()

@app.get("/")
def inicio():
    return {"mensaje": "aqui estamos en la raiz principal del proyecto '/'"}

@app.get("/cliente")
def cliente():
    return {
        "id":1234,
        "nombre":"Katherin",
        "programa":"ADSO"
    }

@app.get("/productos")
def productos():
    return{
        "id":3456,
        "nombre":"papas",
        "descripcion":"fritolay"
    }

@app.get("/usuarios")
def usuarios():
    return[{
        "id" : 1,
        "nombre": "camila",
        "apellido": "perez",
        "numero documento": 100532155,
        "telefono": 3105214567,
        "correo": "camilaperez@gmail.com",
        "password": ""
    },
    {
        "id" : 2,
        "nombre" : "Paola",
        "apellido" : "Suarez",
        "numero documento" : 102354789,
        "telefono" : 3152645987,
        "correo" : "paosuarez@gmail.com",
        "password" : ""
    }
    ]
@app.get("/perfiles")
def perfiles():
    return[{
        "id" : 1,
        "nombre" : "administrador"
    },
    {
        "id" : 2,
        "nombre" : "cliente"
    },
    {
        "id" :3,
        "nombre" : "supervisor"
    }
    ]