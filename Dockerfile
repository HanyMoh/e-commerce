FROM ruby:2.5.3-slim


ENV BUILD_PACKAGES="build-essential libpq-dev libxml2-dev libxslt1-dev pkg-config" \
    RUN_PACKAGES="nodejs tzdata libpq5 libxml2 libxslt1.1" \
    EXTRA_PACKAGES="git imagemagick libmagickwand-dev libmagic-dev tcpdump net-tools iputils-ping"

ENV RAILS_APP_PATH /srv/nasnav/backend

ENV RAILS_SERVE_STATIC_FILES=1 \
    RAILS_LOG_TO_STDOUT=1 \
    RAILS_ENV=production \
    RACK_ENV=production

# Create app directory
WORKDIR $RAILS_APP_PATH

# Install app dependencies
COPY Gemfile Gemfile.lock $RAILS_APP_PATH/

# Install rails deps & nginx - (pkg-config for nokogiri with system libs)
RUN apt-get update \
    && apt-get install -y --no-install-recommends $BUILD_PACKAGES $RUN_PACKAGES $EXTRA_PACKAGES\
    && gem install bundler \
    && env NOKOGIRI_USE_SYSTEM_LIBRARIES=true \
        bundle install --jobs 4 --deployment --without development test \
    && apt-get purge -y --auto-remove $BUILD_PACKAGES \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && bundle clean \
    && rm -rf /tmp/* /var/tmp/*

# Bundle app source
COPY . $RAILS_APP_PATH

# Provide dummy data to Rails so it can pre-compile assets.
RUN mkdir -p $RAILS_APP_PATH/log $RAILS_APP_PATH/shared/sockets $RAILS_APP_PATH/shared/log/nginx $RAILS_APP_PATH/shared/pids
RUN bundle exec rake RAILS_ENV=production assets:precompile --trace

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$RAILS_APP_PATH/public"]
VOLUME ["$RAILS_APP_PATH/ssl"]

EXPOSE 3000
ENTRYPOINT [ "./bin/entrypoint.sh" ]
CMD [ "app:server" ]
