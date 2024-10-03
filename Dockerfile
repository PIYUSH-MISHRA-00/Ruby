# Use an official Ruby runtime as the base image
FROM ruby:3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Set an environment variable to avoid installing gem documentation
ENV RAILS_ENV='production' \
    RACK_ENV='production' \
    BUNDLE_PATH='/gems'

# Set up a directory for the app
WORKDIR /my_clinic_app

# Copy the Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

# Install gems (including those for production)
RUN bundle install --without development test

# Copy the rest of the application code to the working directory
COPY . .

# Precompile assets for production
RUN bundle exec rake assets:precompile

# Set up an entry point script to handle DB migrations and starting the server
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Expose port 3000 to the Render environment
EXPOSE 3000

# Use the entrypoint script to run migrations and start the Rails server
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
