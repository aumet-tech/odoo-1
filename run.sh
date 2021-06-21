source venv/bin/activate

#python3 odoo-bin --addons-path=addons -d aumit --db_host=127.0.0.1 --db_user=aumit-user  --db_password=aumit-password

docker network create aumet

docker-compose up -d  --network my-net

docker  --expose 8069 -p 127.0.0.1:8069:8069  run aumet-odoo --name aumit-odoo-container


# docker  --expose 8069 -p 127.0.0.1:8069:8069 --mount src="$(pwd)" run aumet-odoo