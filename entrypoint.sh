#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /my_clinic_app/tmp/pids/server.pid

# Check if the database exists. If not, create the database and run migrations.
bundle exec rails db:prepare

# Start the Rails server.
exec bundle exec rails server -b 0.0.0.0 -p 3000
