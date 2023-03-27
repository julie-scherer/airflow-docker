PROJECT_NAME=airflow-docker
include .env

.PHONY: airflow run
airflow run:
	docker-compose down --volumes --rmi all
	if [ ! -f .env ]; then cp .env_temp .env ; fi
	docker-compose -f docker-compose.yaml up --build -d

.PHONY: airflow stop
airflow stop:
	docker images -aq | awk '/$(PROJECT_NAME)/ { print $$3 }' | xargs docker rmi -f
	docker ps -a | awk '/$(PROJECT_NAME)/ { print $$1 }' | xargs docker rm -vf
	docker-compose down --volumes --rmi all

.PHONY: docker prune
docker prune:
	docker rmi -f $(docker images -a)
	docker rm -vf $(docker ps -a)
	# docker container prune -f 
	# docker image prune -f 
	# docker volume prune -f