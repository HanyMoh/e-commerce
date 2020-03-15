
build_postgres:
	./devops/bin/build_postgres.sh

#-- Old targets ---------------------------------------------------------------

up:
	docker-compose up -d $(filter-out $@,$(MAKECMDGOALS))

build:
	docker-compose build $(filter-out $@,$(MAKECMDGOALS))

run:
	docker-compose run --rm $(filter-out $@,$(MAKECMDGOALS))

restart:
	docker-compose restart $(filter-out $@,$(MAKECMDGOALS))

console:
	docker-compose run --rm rails rails console

bash:
	docker-compose run --rm rails bash

gmigration:
	docker-compose run --rm rails rails g migration $(filter-out $@,$(MAKECMDGOALS))

migrate:
	docker-compose run --rm rails rake db:migrate $(filter-out $@,$(MAKECMDGOALS))

swagger:
	docker-compose run --rm rails rake swagger:docs && ./fixRakeSwagger.sh

urls:
	docker-compose run --rm rails rake routes

logs:
	docker-compose logs -f --tail=70 $(filter-out $@,$(MAKECMDGOALS))

test:
	docker-compose run --service-port --rm rails rspec $(filter-out $@,$(MAKECMDGOALS))

debug:
	docker-compose run --service-port --rm $(filter-out $@,$(MAKECMDGOALS))
