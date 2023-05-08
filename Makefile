PROJECT_NAME=airflow-docker
include .env

up:
	@if [ ! -f .env ]; then cp .env_temp .env ; fi
	docker-compose up --remove-orphans --build -d

down:
	docker-compose down --volumes --rmi all

clean:
	docker rm -vf ${PROJECT_NAME}
	docker rmi -f ${PROJECT_NAME}

logs: 
	docker-compose logs -f
