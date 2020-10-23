# Docker Python ETL Images

Various docker images for providing a simple Python environment with packages for data/ETL type activities.

This project serves as an area to learn about Docker and also provide some common tooling to myself for data engineering.

## docker-python-etl-base

Base image which contains a Python 3.8 environment with popular packages such as:

- Data
  - pandas
  - pyarrow
  - psycopg2
  - pyodbc and Microsoft SQL ODBC driver
- Scraping
  - scrapy
  - requests

## docker-python-etl-azure

Contains everything in the base image along with additional packages for Azure such as:

- azure-core
- azure-cosmos
- azure-eventgrid
- azure-eventhub
- azure-identity
- azure-keyvault-secrets
- azure-servicebus
- azure-storage-file-datalake
- azure-storage-file-share
- azure-storage-queue

## docker-python-etl-jupyter

Contains everything in the azure image along with additional packages for interactive exploration:

- OpenJDK 11
- Jupyter Lab
- pyspark
  - TODO: maybe split out