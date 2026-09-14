from fastapi import FastAPI
import random
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()

# Сборка метрик Prometheus
Instrumentator().instrument(app).expose(app)

@app.get("/")
def read_root():
	return {"starus":"ok", "message":"Service is working"}

@app.get("/compute")
def do_work():
	# Это страница на которой выполняются какие-то вычисления
	random_num = random.randint(1, 100)
	result = sum(i * i for i in range(10_000 + random_num * 10))
	return {"result":result, "random_number":random_num}
