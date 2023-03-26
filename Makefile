PROJECT_NAME=airflow-docker
include .env

.PHONY: up
up:
	make down
	docker-compose -f docker-compose.yaml up --build
	echo "Access the Airflow UI by navigating to http://localhost:8080 in your web browser. The default username and password is airflow."

.PHONY: down
down:
	docker-compose down
	docker ps -a | awk '/$(PROJECT_NAME)/ { print $$1 }' | xargs docker rm -f
	docker images -a | awk '/$(PROJECT_NAME)/ { print $$3 }' | xargs docker rmi -f
	docker-compose down --volumes --rmi all