# docker-rails6-mysql8
docker-composeにてrails6とmysql8を使った構成テンプレート

## 以下手順

### まずビルド
`docker-compose build`

### バックグラウンドでwebを起動
`docker-compose up -d`

### apiモードでrails new! (viewが作成されなくなる)
`docker-compose run web bundle exec rails new . -d mysql --api`

*webとは、コンテナ名のこと。これを指定しないとエラーが出る。bundleやrailsがありませんと。

### viewは欲しい場合
`docker-compose run web bundle exec rails new . -d mysql`
