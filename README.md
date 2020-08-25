# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

---

# RailsVue App 20/8/25

## 基本コマンド

- 開始:
  - $ bundle exec rails s
  - $ bin/webpack-dev-server
- ルーティング確認:
  - $ rails routes

---

## 初期設定 環境構築

$ rails _6.0.2.1_ new rails-vue-memo-app --database=postgresql
※バージョン指定は適宜

$ bundle install --path vendor/bundler

$ rails db:create
$ bundle exec rails db:create

$ bundle exec rails s

> Created database 'rails_vue_memo_app_development'
Created database 'rails_vue_memo_app_test'

### Vue環境
$ rails webpacker:install:vue

---

## エラー

### 症状：初期構築時 postgresql環境が無い

> gem install pg -v '1.2.3' --source 'https://rubygems.org/'

対応：入れる
$ brew install postgresql
$ brew link --overwrite node

> 参考：自身のWiki
- 2.6系だとエラーが出るので、一旦2.5系でセット
[[Create 01] Rails install · BoxPistols/tweetApp_Rails_TP Wiki · GitHub](https://github.com/BoxPistols/tweetApp_Rails_TP/wiki/%5BCreate-01%5D-Rails-install)

---

### 症状：初期/rails db:create
> connections on Unix domain socket "/tmp/.s.PGSQL.5432"?

対応：psqlを起動、再起動
$ psql -l <- 無い
$ brew services restart postgresql
$ psql -l <- 出た

参考：
[macos+homebrew+postgres で接続エラー「PG::ConnectionBad: 〜"/tmp/.s.PGSQL.5432"?」を解決 - Qiita](https://qiita.com/hirocueki2/items/327dc6e87005edf622ad)

[Postgresqlに接続できなくなった時 - Qiita](https://qiita.com/ms2sato/items/a0f7d32a3ecda76a7be3)

---

### 症状：webpackerが無い
> Please run rails webpacker:install ...

対応：入れる
$ rails webpacker:install

参考：
[Rails6 開発時につまづきそうな webpacker, yarn 関係のエラーと解決方法 - Qiita](https://qiita.com/NaokiIshimura/items/8203f74f8dfd5f6b87a0)

---

## ルーティング コントローラー作成

- ルーティング
  - config/routes.rb
  - homeを作成

```rb
Rails.application.routes.draw do
  get 'home', to: 'home#index'
end
```

- homeコントローラー作成
  - $ rails g controller home

```js
create  app/controllers/home_controller.rb
invoke  erb
create    app/views/home
invoke  test_unit
create    test/controllers/home_controller_test.rb
invoke  helper
create    app/helpers/home_helper.rb
invoke    test_unit
invoke  assets
invoke    scss
create      app/assets/stylesheets/home.scss
```

- homeコントローラーをindexさせる
  - app/controllers/home_controller.rb

```rb
class HomeController < ApplicationController
  def index
  end
end
```

- Vueの設置確認
  - app/javascript/app.vue

- Vueのjs読み込み
  - app/views/home/index.html.erb

```html
<%= javascript_pack_tag 'hello_vue' %>
<%= stylesheet_pack_tag 'hello_vue' %>
```
