FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs sqlite3
RUN mkdir /blog
WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN bundle install
COPY . /blog


EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
