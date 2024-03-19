all: build

build:
	mkdir -p /home/justineb/data
	mkdir -p /home/justineb/data/wordpress
	mkdir -p /home/justineb/data/database
	docker compose -f ./srcs/docker-compose.yml up --build

execnginx:
	docker exec -it nginx /bin/bash

execmariadb:
	docker exec -it mariadb /bin/bash

execwordpress:
	docker exec -it wordpress /bin/bash

down:
	docker compose -f ./srcs/docker-compose.yml down
	docker system prune -af --volumes
	docker network prune -f
	docker volume prune -f
	docker volume rm srcs_mariadb -f
	docker volume rm srcs_wordpress -f
	rm -rf /home/justineb/data

re: down build