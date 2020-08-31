.PHONY: build

build:
	docker build --no-cache --tag ac93_codewars:7.0 .
	${exec} composer require --dev phpunit/phpunit

# github token for composer: https://www.previousnext.com.au/blog/managing-composer-github-access-personal-access-tokens
exec = docker run \
	--init \
	--interactive \
	--tty \
	--rm \
	--user $$(id -u) \
	--env COMPOSER_AUTH='{"github-oauth": {"github.com": ""}}' \
	--volume "$$(pwd):/app" \
	--workdir /app \
	ac93_codewars:7.0

ci:
	${exec} composer install

shell:
	${exec} bash

run:
	${exec} $(args)

app:
	${exec} php src/index.php

test:
	${exec} bash -c "./vendor/bin/phpunit $(args)"

