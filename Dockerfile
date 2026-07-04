# Build stage --dependencies
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --user -r requirements.txt

#Build final stage
FROM python:3.11-slim AS production

RUN useradd -m flaskuser

WORKDIR /app

COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH


COPY . .
USER flaskuser

CMD ["python","app.py"]
EXPOSE 5000




