FROM alpine:latest
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN apk update && apk upgrade \
&& apk add ruby ruby-json \
&& apk add ruby-dev make g++ \
&& gem install bundler  --no-ri --no-rdoc \
&& bundle install --no-cache \
&& gem uninstall bundler \
&& apk del ruby-dev make g++ \
&& gem cleanup \
&& rm -rf /usr/lib/ruby/gems/*/cache/* \
&& rm -rf /var/cache/apk/* /tmp

ADD . $APP_HOME
ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292
CMD ["puma"]
