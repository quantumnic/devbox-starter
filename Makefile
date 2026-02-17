.PHONY: build up shell down clean

build:
	docker compose build

up:
	docker compose up -d

shell:
	docker compose exec dev zsh

down:
	docker compose down

clean:
	docker compose down -v --rmi local
