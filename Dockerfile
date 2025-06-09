FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --allow-insecure-repositories \
 && apt-get install -y --no-install-recommends gcc \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt ./

RUN pip install --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
