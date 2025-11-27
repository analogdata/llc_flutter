from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.post("/authenticate")
def authenticate(email: str, password: str):
    if email == "admin@email.com" and password == "admin":
        return {"message": "Authentication successful"}
    return {"message": "Authentication failed"}


@app.post("/info")
def info(email: str, name: str, mobile: str):
    print(email, name, mobile)
    return {"info": "success"}
