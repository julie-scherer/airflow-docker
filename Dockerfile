ARG AIRFLOW_IMAGE_VERSION=${AIRFLOW_IMAGE_VERSION:-latest}

FROM apache/airflow:$AIRFLOW_IMAGE_VERSION

ENV AIRFLOW_USER=${AIRFLOW_USER:-airflow}
ENV AIRFLOW_PASSWORD=${AIRFLOW_PASSWORD:-airflow}
ENV AIRFLOW_USER_HOME=${AIRFLOW_HOME:-/opt/airflow}
ENV AIRFLOW_UID=${AIRFLOW_UID:-50000}

USER airflow
WORKDIR ${AIRFLOW_USER_HOME}

# RUN pip install --upgrade pip \
#     && pip install --no-cache-dir apache-airflow[]