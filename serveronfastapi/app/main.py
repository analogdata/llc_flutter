from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

app = FastAPI()

origins = [
    "*",
    "http://localhost:8000"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def read_root():
    return {"Hello": "Welcome to India"}


@app.get("/add/{a}/{b}")
def add(a: int, b: int):
    return {"result": a + b}


class Request(BaseModel):
    a: int
    b: int


@app.post("/multiply")
def multiply(input: Request):
    data = {
        "result": input.a * input.b
    }
    return data
