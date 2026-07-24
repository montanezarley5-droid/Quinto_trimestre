from fastapi import FastAPI
from pydantic import BaseModel 
from typing import List

#crear la aplicacion 
app = FastAPI()

#Modelo de los datos
class Task(BaseModel):
    id: int
    name: str
    completed: bool = False

#nuestra simulacion de la base de datos
db = [{"id": 1, "name": "Tarea 1", "completed": False},
      {"id": 2, "name": "Tarea 2", "completed": True}
     ]

#creacion de la ruta principal
@app.get("/")
def inicio():
    return{"mensaje": "Bienvenidos a mis tareas"}

#pip install -r requirements.txt
#python -m uvicorn main:app --reload 
@app.get("/tasks", response_model=List[Task])
def get_task():
    return db 

#crear una nueva tarea 
@app.post("/tasks", response_model=Task)
def crear_task(task: Task):
    db.append(task.dict())
    return task