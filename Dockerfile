# Use an official Ruby runtime as a parent image
FROM ruby:3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Set environment variables
ENV RAILS_ENV='production' \
    RACK_ENV='production' \
    BUNDLE_PATH='/gems'

# Create app directory
WORKDIR /my_clinic_app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems including production group gems
RUN bundle install --without development test

# Copy the rest of the application code to the container
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

# Make the entrypoint script executable
RUN chmod +x /my_clinic_app/entrypoint.sh

# Expose port 3000 to allow the app to be accessible
EXPOSE 3000

# Set the entrypoint script
ENTRYPOINT ["/my_clinic_app/entrypoint.sh"]
