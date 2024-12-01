# syntax=docker/dockerfile:1

# 本ファイルは Docker 公式ドキュメントからもリンクされている以下のページを参考にしています。
# https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/official-documentation-samples/rails

# Rails 8 で rails new したときに本 Dockerfile は上書きされます。
# そのため、本ファイルは Rails 8 で rails new するための最小限のことだけ記述しています。

FROM ruby:3.3.6

WORKDIR /myapp

COPY Gemfile /myapp
COPY Gemfile.lock /myapp

RUN bundle install
