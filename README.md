# README

# 環境構築
## 構築手順
- Gighubからリポジトリをcloneする。
- .envファイルを作成する。
  - USERNAME=<ユーザー名>
  - MYSQL_DATABASE=<DB名>
- コンテナをビルドする。(イメージの作成)
```
$ docker-compose build
```

- DBを作成する。
```
$ docker-compose web rails db:create
```

- コンテナを起動する。
```
docker-compose up -d
```

## 環境構築後の動作確認
- ブラウザで`localhost:3001`にアクセスする。

# DB操作
- migrationを使用していない。
- ridgepoleでDB操作を行う。
