FROM ruby:2.6.2-stretch

ENV APP_HOME /home/job_matching_app
WORKDIR $APP_HOME

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential libpq-dev
# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
#   libpq-dev postgresql-client-common postgresql-client build-essential && rm -rf /var/lib/apt/lists/*

COPY Gemfile* ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . .

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
