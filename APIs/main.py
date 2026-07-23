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

#Me crea una instancia de la aplicacion 
#y app es una variable que sera la que utliza el servidor para ejecutar la API
app = FastAPI()

#Es un decorador, "programcion modeerna", defenimos la ruta
#Definimos la url raiz respondiendo a solicitudes get
@app.get("/")

#Definimos la funcion que se ejecutara cuando alguien visite la url raiz
def inicio():

#La funcion inicio nos devuelve un diccionario
#La API automaticamente lo convierte en JSON.
    return {"mensaje": "Hola esta es mi api att Patricio"}

#main.py es el archivo principal que contiene la fastAPI
# "/" DEFINIMOS LAS RUTAS O PATH