docker compose build
docker compose up -d
docker compose exec web rails db:create
docker compose exec web rails db:migrate
if [$? -ne 0]
then
    echo "rails db:migrateコマンドに失敗しました。"
    read -p "Hit Enter"
    exit 1
fi
docker compose exec web rails db:migrate RAILS_ENV=test

docker compose exec web echo a | rails webpacker:install
docker compose exec web rails webpacker:compile
docker compose run web bundle exec rspec spec/ --format documentation

echo "Finish review ?"
echo "Close this environment."
while read -p "Are you sure you want to finish? (y/N): " yn
do
    case "$yn"
    in
    [yY]*) docker compose down
        break;;
    *) continue ;;
    esac
done
echo "finished"
read -p "Hit Enter: "