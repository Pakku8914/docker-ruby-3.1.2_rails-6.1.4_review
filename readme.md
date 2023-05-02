# dockerでレビュー

## 事前確認
- Docker Desktopがインストールされているか？
  - https://www.docker.com/products/docker-desktop/
  - このサイトからインストーラーをダウンロードし、インストーラーを実行し、インストールする。

## レビュー手順
1. Docker Desktopを起動する
2. レビュー対象のリポジトリからcloneする
3. このディレクトリ内の`Dockerfile`, `docker-compose.yml`, `review.sh`ファイルをcloneしたディレクトリ内にコピーする
4. ターミナルで対象リポジトリのディレクトリに移動する
5. review.shを実行する
   - git bashで実行する場合のコマンド
     - `sh review.sh`
   - powershellで実行する場合のコマンド
     - `.\review.sh`
6. viewページで動作確認する
  - ブラウザで、`localhost:3000`をURL欄に入力し、遷移する
7. Rspecがシェルで実行されているので、エラーが無いか確認する

### 注意 ###
- `Are you sure you want to finish? (y/N): `とターミナルに出てくれば大文字小文字関係なく`y`を押せばスクリプトが終了する。
- しかし、終了するとブラウザで実行することが出来ないため、必ずレビューを終わらせてからyを押してください！