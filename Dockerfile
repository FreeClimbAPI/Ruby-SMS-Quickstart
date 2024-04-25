FROM ruby:3.3

WORKDIR /Ruby-SMS-Quickstart

# Copy gemfiles to install dependencies
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# Build the application
RUN bundle install

# Copy the source code into the container
COPY . .

# Run the application
ENTRYPOINT ["bundle", "exec", "rake", "start"]
