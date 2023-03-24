FROM ruby:3.2.1-alpine

RUN apk --update add build-base nodejs git zsh tzdata postgresql-dev postgresql-client libxslt-dev libxml2-dev imagemagick openssh-client

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN bundle install