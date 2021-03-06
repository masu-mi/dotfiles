# vim: fileencoding=utf-8

from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
async def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
async def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}


def main():
    uvicorn.run(app, host='0.0.0.0', port=8000)

if __name__ == '__main__':
    main()
