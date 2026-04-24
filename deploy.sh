gcloud run deploy roberta-aigtd \
  --source . \
  --set-env-vars MODEL_ID=mehddii/roberta-aigt-finetuning-v4 \
  --port 8080 \
  --memory 6Gi \
  --cpu 4 \
  --allow-unauthenticated \
  --region europe-west3
