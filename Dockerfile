FROM ruby:3.2.1 as base

ENV DEFAULT_PORT=3000
ENV BUNDLE_WITHOUT="development test"
ENV RAILS_ENV=production

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install
RUN rails assets:precompile

ADD . /docker/app

EXPOSE ${DEFAULT_PORT}

CMD ["rails", "server", "-b", "0.0.0.0"]
