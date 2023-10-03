NAME = Inception

DOCK_COMP = ./srcs/docker-compose.yml

$(NAME): build run

all: $(NAME)

build:
	-mkdir -p /home/gponcele/data/mariadb
	-mkdir -p /home/gponcele/data/wordpress
	docker compose -f $(DOCK_COMP) build

run:
	-docker compose -f $(DOCK_COMP) up -d

down:
	docker compose -f $(DOCK_COMP) down

clean: down
	docker rm -f wordpress
	docker rm -f nginx
	docker rm -f mariadb
	docker rmi srcs-wordpress
	docker rmi srcs-nginx
	docker rmi srcs-mariadb
	docker system prune

re:
	clean all

deep: clean
	rm -rf ~/data

.PHONY: build run down clean re deep
