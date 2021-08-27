FROM ruby:2.7.1

RUN gem install bundler -v 2.2.26

RUN wget -q https://deb.nodesource.com/setup_12.x -O- | bash - \
  && echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" >> /etc/apt/sources.list \
  && wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O- | apt-key add -

RUN apt-get update -qq && apt-get install -y nodejs libpq-dev postgresql-client

WORKDIR /app

COPY . .

RUN bundle install
RUN npm install
