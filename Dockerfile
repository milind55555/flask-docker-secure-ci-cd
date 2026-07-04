# Build stage --dependencies
FROM python:3.11-slim AS Builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --user -r requiremenets.txt

#Build final stage
FROM python:3.11-slim AS production

RUN useradd -m flaskuser

WORKDIR /app

COPY --Builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH


COPY . .
USER flaskuser

CMD ["python","app.py"]
EXPOSE 5000




