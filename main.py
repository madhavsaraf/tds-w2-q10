from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Observability API running"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}
