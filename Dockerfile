FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt ./

# GPG 서명 오류 무시하며 빌드 필수 패키지 설치
RUN apt-get -o Acquire::AllowInsecureRepositories=true \
    -o Acquire::AllowUnauthenticated=true \
    -o Acquire::https::Verify-Peer=false \
    update && \
    apt-get install -y --no-install-recommends gcc g++ libffi-dev && \
    rm -rf /var/lib/apt/lists/*

# pip 설치 환경 보장
RUN python -m ensurepip --upgrade && \
    pip install --upgrade pip setuptools

# 의존성 설치
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
