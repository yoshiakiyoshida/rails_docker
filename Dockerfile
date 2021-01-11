FROM ruby:2.7

# ライブラリのアップデート
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn

#コンテナ内の作業ディレクトリを作成
WORKDIR /app

#ローカルの作業場所を、コンテナ内の作業場所にコピー
COPY ./src /app

#gemのインストール先の指定・gemのインストール
RUN bundle config --local set path 'vender/bundle' \
  && bundle install

CMD ["/bin/bash"]