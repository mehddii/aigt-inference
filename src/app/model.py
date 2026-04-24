from transformers import pipeline, AutoTokenizer
import os

MODEL_ID=os.getenv("MODEL_ID", "mehddii/roberta-aigt-finetuning-v4")
MAX_LENGTH = 512

model = pipeline(
    "text-classification", 
    model=MODEL_ID,
    truncation=True,
    max_length=MAX_LENGTH,
)

tokenizer = AutoTokenizer.from_pretrained(MODEL_ID)

def tokenize(text: str):
    return tokenizer.encode(text, truncation=True)

def classify(text: str):
    return model(text)
