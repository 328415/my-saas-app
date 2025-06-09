FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt ./

# 1. apt로 필수 빌드 도구 설치
RUN apt-get update -o Acquire::AllowInsecureRepositories=true \
 && apt-get install -y --no-install-recommends gcc g++ libffi-dev \
 && rm -rf /var/lib/apt/lists/*

# 2. pip 미설치 가능성 대비
RUN python -m ensurepip --upgrade \
 && pip install --upgrade pip setuptools

# 3. 의존성 설치
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
