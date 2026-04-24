gcloud run deploy aigt-inference \
  --source . \
  --set-env-vars MODEL_ID=mehddii/roberta-aigt-finetuning-v4 \
  --port 8080 \
  --memory 4Gi \
  --cpu 2 \
  --allow-unauthenticated \
  --region europe-west3
