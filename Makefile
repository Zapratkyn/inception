all:
	docker compose -f ./srcs/docker-compose.yml -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

up:
	@docker compose -f ./srcs/docker-compose.yml up

clean:
	docker rm -f $(docker ps -qa); \
	docker system prune --volume -fa

deep: clean
	rm -rf ~/data

.PHONY all re down clean deep
