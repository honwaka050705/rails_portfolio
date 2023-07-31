# 変換いろいろ([prot-type] Rails + jQuery + MySQL)
## 概要
- 各種様々な変換機能をまとめる予定です。
  - (まだ、和暦から西暦に変換するものしかありません)
- こちらはプロトタイプで、ある程度方針が固まったら、  
以下のリポジトリを中心に機能追加や改修を進める予定です。
  - https://github.com/honwaka050705/graphql-portforio

## 参考
- 環境構築
  - https://zenn.dev/wakkunn/articles/33c84147608078

---
## 環境構築手順
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

- 動作確認
  - ブラウザで`localhost:3001`にアクセスする。

## DB操作
- migrationを使用していない。
- ridgepoleでDB操作を行う。

## よく使うdocker-composeコマンド
- TODO 後日、makeコマンドインストールしてコマンド入力を簡略化予定。
- [参考]
  - https://www.aska-ltd.jp/jp/blog/212
```
$ docker-compose exec web /bin/bash
```