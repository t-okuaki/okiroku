# syntax=docker/dockerfile:1

# 本ファイルは Docker 公式ドキュメントからもリンクされている以下のページを参考にしています。
# https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/official-documentation-samples/rails

FROM ruby:3.3.6

ENV APP_ROOT=/myapp

WORKDIR $APP_ROOT

RUN apt-get update -qq && apt-get install -y \
    vim \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install

COPY . $APP_ROOT

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]