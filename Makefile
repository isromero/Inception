COMPOSE					= docker compose
COMPOSE_FILE		= ./srcs/docker-compose.yml
PROJECT_NAME		= inception

VOLUME_DIR_WP		= /home/isromero/data/wordpress_data
VOLUME_DIR_DB		= /home/isromero/data/db_data
# MACOS: VOLUME_DIR_WP		= /Users/isromero/data/wordpress_data
# MACOS: VOLUME_DIR_DB		= /Users/isromero/data/db_data

.PHONY: all build up up-d down images stop start \
				restart ps logs ls volumes volumes-prune \
				networks networks-prune prune prune-all

all: build up

build:
	mkdir -p $(VOLUME_DIR_WP) $(VOLUME_DIR_DB)
	$(COMPOSE) -f $(COMPOSE_FILE) build 

up:
	$(COMPOSE) -f $(COMPOSE_FILE) up

up-d:
	$(COMPOSE) -f $(COMPOSE_FILE) up -d

down:
	$(COMPOSE) -f $(COMPOSE_FILE) down

images:
	$(COMPOSE) -f $(COMPOSE_FILE) images

stop:
	$(COMPOSE) -f $(COMPOSE_FILE) stop

start:
	$(COMPOSE) -f $(COMPOSE_FILE) start

restart:
	$(COMPOSE) -f $(COMPOSE_FILE) restart

ps:
	$(COMPOSE) -f $(COMPOSE_FILE) ps

logs:
	$(COMPOSE) -f $(COMPOSE_FILE) logs

ls:
	$(COMPOSE) -f $(COMPOSE_FILE) ls

volumes:
	@docker volume ls | grep $(PROJECT_NAME) || echo "No volumes found"

volumes-prune:
	docker volume prune -f
	rm -rf $(VOLUME_DIR_WP) $(VOLUME_DIR_DB)

networks:
	@docker network ls | grep $(PROJECT_NAME) || echo "No networks found"

networks-prune:
	docker network prune -f

prune:
	docker system prune -af

prune-all: down prune volumes-prune networks-prune