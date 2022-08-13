# ruby を docker hub からダウンロード
FROM ruby:2.5
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn
WORKDIR /product-register
# Gemfile を product-register にコピー
# 複数ファイルを指定する場合、宛先のフォルダの最後に / をつけておく
COPY Gemfile Gemfile.lock /product-register/
# bundle は rails 特有のコマンド。Gemfile に記載のものをインストールする
RUN bundle install
