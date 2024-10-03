#!/bin/bash
set -e

# Run database migrations
echo "Running migrations..."
bundle exec rails db:migrate

# Start the server
echo "Starting Rails server..."
exec bundle exec rails server -b 0.0.0.0 -p 3000
