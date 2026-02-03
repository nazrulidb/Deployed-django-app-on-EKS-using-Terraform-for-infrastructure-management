#!/bin/sh

# Wait for Postgres to be ready
echo "Waiting for postgres..."
while ! nc -z db 5432; do
  sleep 0.1
done
echo "PostgreSQL started"

# Apply database migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --no-input

# Start Daphne (Point to 'mysite' based on your screenshot)
echo "Starting Daphne..."
exec daphne -b 0.0.0.0 -p 8000 mysite.asgi:application
