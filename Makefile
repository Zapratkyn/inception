NAME = Inception

DOCK_COMP = ./srcs/docker-compose.yml

$(NAME): build run

all: $(NAME)

build:
	-mkdir -p /home/gponcele/data/mariadb
	-mkdir -p /home/gponcele/data/wordpress
	docker-compose -f $(DOCK_COMP) build

run:
	-docker-compose -f $(DOCK_COMP) up -d

down:
	docker-compose -f $(DOCK_COMP) down

clean: down
	docker rmi srcs_wordpress
	docker rmi srcs_nginx
	docker rmi srcs_mariadb

re: clean all

deep: clean
	sudo rm -rf ~/data

.PHONY: build run down clean re deep
