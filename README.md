# okiroku

## 開発環境構築

```
docker compose build
docker compose run --rm backend rails db:create
docker compose up -d
```

## 開発環境構築後、都度必要なこと

### frontend で使用する npm パッケージに変更があったとき

frontend で使用する npm パッケージに変更があったとき（ `frontend/pacakge.json` の `dependencies` や `devDependencies` が変更されたとき）、 `frontend_node_modules` ボリュームの `node_modules` を最新にするために、以下を実行します。

```
docker compose run --rm frontend yarn install
```

`docker compose build` でイメージ内の `node_modules` にパッケージがインストールされていても、 `docker compose up` の際には `frontend_node_modules` ボリュームの `node_modules` のほうがマウントされて使用されます。そのため `frontend_node_modules` ボリュームの `node_modules` を最新にする必要があります。
