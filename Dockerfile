FROM ruby:2.6.1-alpine

# Install dependencies:
# - build-base: To ensure certain gems can be compiled
RUN apk --update add build-base

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundle && \
    bundle install

ADD . $APP_HOME

COPY ./containers/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
CMD ["entrypoint.sh"]