# airflow-docker

### How to run

1. Fork/clone the repo
2. Copy and paste `.env_temp` to `.env` and update configurations
3. Run `make` commands below:

    `make up` will set up the env, initalize airflow docker image, and run docker container. Once it's done running, you can access the Airflow UI at http://localhost:8080. The default username and password is airflow.

    `make down` will stop the docker container and remove containers and images with the name airflow-docker
