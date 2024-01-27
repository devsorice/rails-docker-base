# Make sure it matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.2.0
FROM ruby:$RUBY_VERSION

# Install libvips for Active Storage preview support
RUN apt-get update -qq && \
    apt-get install -y build-essential libvips && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man


# Set production environment
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    BUNDLE_WITHOUT="development"


RUN gem update --system
RUN gem install rails -v 7.1.3
RUN rails -v