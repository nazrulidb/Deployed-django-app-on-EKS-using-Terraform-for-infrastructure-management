# 1. Base Image
FROM python:3.10-slim

# 2. Environment Variables
# Prevents Python from writing pyc files
ENV PYTHONDONTWRITEBYTECODE=1
# Keeps Python from buffering stdout/stderr (logs appear immediately)
ENV PYTHONUNBUFFERED=1

# 3. Work Directory
WORKDIR /app

# 4. Install System Dependencies
# gcc & libpq-dev are often needed for psycopg2 (Postgres) and other C-extensions
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# 5. Install Python Dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copy Project Code
COPY . /app/

# 7. Expose Port
EXPOSE 8000

# 8. Copy Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 9. Default Command
ENTRYPOINT ["/entrypoint.sh"]