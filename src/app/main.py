from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

from app.model import MAX_LENGTH, tokenize, classify

app = FastAPI()

class DetectionRequest(BaseModel):
    text: str

@app.post("/v1/predict")
async def predict(body: DetectionRequest):
    tokens = tokenize(body.text)

    if len(tokens) > MAX_LENGTH:
        raise HTTPException(
            status_code=422, 
            detail=f"Input too long: {len(tokens)} tokens, max is {MAX_LENGTH}"
        )

    return classify(body.text)
