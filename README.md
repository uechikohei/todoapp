# 手順

## scaffold
`bundle exec rails g scaffold lists description:string completed:boolean`
 listsテーブルに -- 1.descriptionカラムにはstring型のデータが入る。 2.completed:booleanが入る。
 
 ## データベースの作成
 `, default: false` =>t.boolean :completedに対して[デフォルト:偽]を与える。
 `bundle exec rails db:migrate`
 
 ## gem:webpackerの導入(rails6でのjs管理に必要。rails5では不必要。多少デプロイ時に重くなるね。)
 gemfileに追記。=> `gem 'webpacker'`
 
 `docker-compose run web bash`
 `bundle exec rails webpacker:install` =>config/webpacker.ymlファイルやconfig/webpackディレクトリなど作成される。
 => /lists　へアクセス可能になる。
 
 ## rootに/listsを適用
 config/routes.rb に追記 => `root 'lists#index'` (listsはコントローラー名#indexは表示するview内のhtmlファイル名)
 
 ## bootstrap導入
 インストール(webpacker使用)  => `yarn add bootstrap jquery popper.js`
 
   ###  webpacker設定
 config/webpack/environment.js => `const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)`
app/javascrip/src/application.scss => `@import '~bootstrap/scss/bootstrap';`
app/javascrip/packs/application.js => `import 'bootstrap';
import '../stylesheets/application';`

app/views/layouts/application.html.erb => `pack_tag`に変更
