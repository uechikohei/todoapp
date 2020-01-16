# 手順

## scaffold
`bundle exec rails g scaffold lists description:string completed:boolean`

 説明 >> listsテーブルに -- 1.descriptionカラムにはstring型のデータが入る。 2.completed:booleanが入る。
 
 ## boolean偽の追加
 
  `, default: false`  
 説明　>> t.boolean :completedに対して[デフォルト:偽]を与える。
 
 ## データベースの作成

 `bundle exec rails db:migrate`
 
 ## gem:webpackerの導入(rails6でのjs管理に必要。rails5では不必要。多少デプロイ時に重くなるね。)
 gemfileに追記。=> `gem 'webpacker'`
 
 `docker-compose run web bash`
 `bundle exec rails webpacker:install` 
 
 説明　>> config/webpacker.ymlファイルやconfig/webpackディレクトリなど作成される。
         /lists　へアクセス可能になる。
 
 ## rootに/listsを適用
 config/routes.rb に追記 => `root 'lists#index'` 
 
 説明 >> (listsはコントローラー名#indexは表示するview内のhtmlファイル名)
 
 ## bootstrap導入
 インストール(webpacker使用)  => `yarn add bootstrap jquery popper.js`
 
   ###  webpacker設定追記していく内容
 config/webpack/environment.jsに追記　↓
 
 `const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)`

app/javascrip/src/application.scssに追記　↓

`@import '~bootstrap/scss/bootstrap';`

app/javascrip/packs/application.jsに追記　↓

`import 'bootstrap';
import '../stylesheets/application';`

app/views/layouts/application.html.erb => `pack_tag`に変更




# push前に変更ごと
 config/environment/production.rbへ追記。
 
 `  config.assets.compile = true
  config.assets.initialize_on_precompile = false`
  



# herokuへpush(rails6 + mysql2環境)

   ### herokuへの登録が必要
   => https://jp.heroku.com/

   ### herokuへクレジットカード情報登録
   => account settingからクレジット情報と住所の登録


## homebrewでインストール

`brew install heroku/brew/heroku`

`heroku -v`



## remoteからherokuを削除
`git remote rm heroku`

## temoteからoriginを削除
`git remote rm origin`



## デプロイするアプリをgitで管理する

`git remote -v`
で確認

`git add .`
`git commit -m "heroku set up"`





## ログイン

`heroku login`
=> `login` と打つ。
  => ブラウザでログインボタンをおす。
  
  
  
  

## リモートにherokuを準備

`heroku create`
heroku上にアプリ作成


`git remote`
↓と帰ってくるはず
`origin`
`heroku`




## DB追加

`heroku addons:create cleardb:ignite`
「ClearDB MySQL」というアドオンが「Igniteプラン」で追加される。




## mysql2追加の設定

`heroku config | grep DATABASE_URL`
DATABASE_URLの取得


`heroku config | grep CLEARDB_DATABASE_URL`
CLEARDB_DATABASE_URLの取得


`heroku config:add CLEARDB_DATABASE_URL=`
`heroku config:add CLEARDB_ONYX_URL=`
`heroku config:add CLEARDB_TEAL_URL=`
`heroku config:add DATABASE_URL=`
=の続きに取得したDATABASE_URLを(mysql2~)追加。


`heroku config:add DB_USERNAME=root`
`heroku config:add DB_PASSWORD=root`
`heroku config:add DB_PORT='3306'`
設定の追加コマンド。


`heroku config`
で確認。DATABASE_URLの欄がちゃんとmysql2へと変更になっているか？


`heroku run rails db:migrate`
mysql2へと変更した設定を反映させる。





## herokuへとアプリをpush
`git push heroku master`




## herokuアプリの更新
`git push heroku masater`



## heroku再起動
`heroku restart`



## herokuアプリSTOP
`heroku ps:scale web=0`


`heroku ps:scale web=1`
スタート



## URLへアクセス
`heroku open`





# エラー集

## herokuアプリ更新でエラー
`heroku logs --tail`
で確認
`code=H14`
エラーコード

`heroku ps:scale web=1`
コマンド実行で解決.





### 参考

herokuデプロイについて
https://qiita.com/chihiro/items/5c3ff400f6cb99deb945

丁寧なherokuデプロイについて
https://qiita.com/chihiro/items/5c3ff400f6cb99deb945

mysql2追加について
https://qiita.com/murakami-mm/items/9587e21fc0ed57c803d0
