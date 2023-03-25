PROJECT_NAME=airflow-docker
include .env

.PHONY: start
start:
	mkdir -p ./dags ./plugins ./logs
	export AIRFLOW_UID=${AIRFLOW_UID}
	export AIRFLOW_GID=${AIRFLOW_GID}
	docker compose up airflow-init

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: purge
purge:
	docker ps -a | awk '/$(PROJECT_NAME)/ { print $$1 }' | xargs docker rm -f
	docker images -a | awk '/$(PROJECT_NAME)/ { print $$3 }' | xargs docker rmi -f
