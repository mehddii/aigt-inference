FROM python:3.14-slim

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/usr/src/app/src

RUN pip install --no-cache-dir uv

COPY uv.lock pyproject.toml .
RUN uv sync --frozen --no-install-project --no-dev

COPY . .

EXPOSE 8080

CMD ["uv", "run", "--no-sync", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
