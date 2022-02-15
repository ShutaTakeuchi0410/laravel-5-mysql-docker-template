init: set-env key-generate chmod-777
reset-git: rm-git git-init

rm-git:
	rm -rf .git/

git-init:
	git init .

build:
	docker compose build

create-project:
	docker compose run --rm app composer create-project --prefer-dist laravel/laravel . "5.*"

set-env:
	cp ./Docker/App/.env.example ./src/.env
	rm ./src/.env.example

key-generate:
	docker compose run --rm app php artisan key:generate

chmod-777:
	docker compose run --rm app chmod -R 777 storage
	docker compose run --rm app chmod -R 777 bootstrap/cache

app:
	docker compose run --rm app bash

tinker:
	docker compose run --rm app php artisan tinker

migrate:
	docker compose run --rm app php artisan migrate

migrate-reset:
	docker compose run --rm app php artisan migrate:reset

up:
	docker compose up

browse:
	open http://localhost:8000