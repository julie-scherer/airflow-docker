# Airflow in Docker: README

# Deploy Airflow in Docker

This repo deploys Apache Airflow in Docker using the [Airflow Docker image](https://hub.docker.com/r/apache/airflow) on Docker Hub. It’s intended for those who want a quick and easy way to customize their Airflow Docker image. All you have to do is set your [Airflow configurations](https://airflow.apache.org/docs/apache-airflow/2.5.2/configurations-ref.html) in the `.env` file and then those configurations will be used across all the Airflow components (i.e., Postgres database, scheduler, and server).

**Table of Contents**

- [**Usage**](#usage)
- [**Getting Started**](#getting-started)
- [**Development**](#development)
- [**References**](#references)
- [**Roadmap**](#roadmap)

## **Usage**

If you’ve already gone through the [Airflow Quick Start](https://airflow.apache.org/docs/apache-airflow/stable/start.html) and [Running Airflow in Docker](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html) tutorials and you’re at the point where you want to customize your Airflow Docker image, then this is the project for you. 

First, you should COPY+PASTE `.env_temp` to `.env` and replace the values with your desired configurations; or you can just run `make airflow run` as described below and it will automatically do this for you.

Then you can run the `make` commands below:

```docker
make airflow run 
```

This will:

- stop and remove any containers defined in the docker compose file that might still be running
- copy `.env_temp` to `.env` if there isn’t already a `.env` file in the root directory (note: you can specify `AIRFLOW_PROJ_DIR` as somewhere other than the root dir in the `.env` file)
- create the `/dags`, `/plugins`, and `/logs` folders if they don’t already exist in the project directory
- initialize the Airflow database and create a new user `admin` (or whatever you defined the user as in the `.env` file)
- run the scheduler and start the web server on port 8080

Once it's done running, you can access the Airflow UI at http://localhost:8080. The default username and password are both `admin`.

```docker
make airflow stop
```

This will:

- remove any containers and images with the name `airflow-docker` (this is the `PROJECT_NAME` defined in the first line of the `Makefile`)
- stop and/or remove all the containers, networks, volumes, and images defined in the docker compose file that were created by the `make airflow run` command
    
    (I went a little overboard just to *really* make sure all the containers, volumes, etc. were stopped and removed to avoid potential issues when running the container again)
    

Note: You can also set other [Airflow configurations](https://airflow.apache.org/docs/apache-airflow/2.5.2/configurations-ref.html) as environment variables not already in the .env file and they will be automatically loaded into the Docker image and used across all the Airflow components. 

## **Getting Started**

### **Prerequisites**

- Install [Docker](https://docs.docker.com/get-docker/)

### How to run

1. Fork/clone the repo
2. Run `make airflow run`

## References

- [https://airflow.apache.org/docs/apache-airflow/stable/start.html](https://airflow.apache.org/docs/apache-airflow/stable/start.html)
- [https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html)
- [https://jyotisachdeva57.medium.com/part-3-setting-up-airflow-2-0-via-docker-360a93c85428](https://jyotisachdeva57.medium.com/part-3-setting-up-airflow-2-0-via-docker-360a93c85428)
- [https://www.youtube.com/watch?v=TkvX1L__g3s&t=525s](https://www.youtube.com/watch?v=TkvX1L__g3s&t=525s)

## **Roadmap**

This is a part of a multi-series project I’m working on where I’m exploring running Airflow in different environments, from testing (local) to dev (Docker) to production (Kubernetes). For more, see [airflow-local](https://github.com/schererjulie/airflow-local) and [airflow-kubernetes-eks](https://github.com/schererjulie/airflow-kubernetes-eks).