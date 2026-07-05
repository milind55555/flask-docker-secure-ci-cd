# Build stage --dependencies
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

# Install dependencies system-wide (not --user)
RUN pip install --prefix=/install -r requirements.txt

# Build final stage
FROM python:3.11-slim AS production

# Create non-root user
RUN useradd -m flaskuser

WORKDIR /app

# Copy installed packages from builder
COPY --from=builder /install /usr/local

# Copy application code
COPY . .

USER flaskuser

EXPOSE 5000
CMD ["python", "app.py"]
