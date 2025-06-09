FROM python:3.10-bullseye

WORKDIR /app

COPY requirements.txt ./

# 빌드 필수 패키지 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc g++ libffi-dev && \
    rm -rf /var/lib/apt/lists/*

# pip 환경 설정
RUN python -m ensurepip --upgrade && \
    pip install --upgrade pip setuptools

# 의존성 설치
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]


