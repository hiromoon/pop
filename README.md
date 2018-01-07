# Pop

Elixir/PhoenixによるOpenID ConnectのOpenID Provider実装。

## 使い方

依存モジュールのインストールをします。
```
$ mix deps.get
```

データベースとマイグレーションファイルの作成をします。
```
$ mix ecto.create && mix ecto.migrate
```

Node.jsの依存パッケージをインストールします。
```
$ npm install
```

アプリケーションを起動します。
```
$ mix phoenix.server
```

[`localhost:4000`](http://localhost:4000) へブラウザでアクセスしてください。

