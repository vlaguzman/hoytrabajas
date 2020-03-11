FROM ruby:2.6.3
ENV LANG=C.UTF-
ENV LC_ALL=C.UTF-8
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update
RUN apt-get install -y nodejs yarn
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql-client-9.5
RUN apt-get install -y w3m
RUN apt-get install -y bc
RUN apt-get install -y default-jdk
RUN apt-get install -y default-jre
RUN apt-get update && \
  apt-get install -qq -y --no-install-recommends cron && \
  rm -rf /var/lib/apt/lists/*

ENV APP_HOME /ht
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_PATH /ht/.gems
ENV GEM_HOME /ht/.gems
COPY ./.ssh /root/.ssh/

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN gem install bundler:2.0.2
RUN gem install whenever:0.9.4