FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt ./

# GPG 오류 우회 및 gcc 설치
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       g++ \
       libffi-dev \
    && rm -rf /var/lib/apt/lists/* \
    || true

RUN pip install --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
