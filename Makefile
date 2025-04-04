WP_DATA = /home/data/wordpress
DB_DATA = /home/data/mariadb

CONTAINERS = mariadb wordpress nginx
VOLUMES = srcs_mariadb srcs_wordpress
IMAGES = mariadb:user wordpress:user nginx:user
NETWORKS = inception

all: up

up: build
	@sudo mkdir -p $(WP_DATA)
	@sudo mkdir -p $(DB_DATA)
	sudo docker-compose -f srcs/docker-compose.yml up -d

down:
	sudo docker-compose -f srcs/docker-compose.yml down

stop:
	sudo docker-compose -f srcs/docker-compose.yml stop

start:
	sudo docker-compose -f srcs/docker-compose.yml start

build:
	sudo docker-compose -f srcs/docker-compose.yml build

clean:
	sudo docker stop $(CONTAINERS) || true
	sudo docker system prune -af || true
	sudo docker volume rm $(VOLUMES) || true
	sudo rm -rf /home/data/wordpress || true
	sudo rm -rf /home/data/mariadb || true

re: clean up