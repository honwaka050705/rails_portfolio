FROM ruby:3.1.2
RUN mkdir /app
WORKDIR /app
ARG RUBYGEMS_VERSION=3.3.20
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
# Using Node.js v14.x(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y \
      git \
      nodejs \
      vim
RUN npm i bootstrap-icons
RUN gem update --system ${RUBYGEMS_VERSION} && bundle install
COPY . /app
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000
CMD ["rails" "server" "-b" "0.0.0.0"]
