# airflow-docker

### Getting started

To get Airflow up and running with Docker, all you have to do is fork the repo, navigate to the root dir, and run the `make` commands below.

- run `make start` to set up repo and initalize airflow docker image

- run `make up` to run docker container

Now you can access the Airflow UI by navigating to http://localhost:8080 in your web browser. The default username and password is airflow.

### Cleaning up

- run `make down` to close docker container

- run `make clean` to remove airflow docker containers and images