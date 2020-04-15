# This is dockerization of the local development environment described in the AWS Glue docs:
# https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-libraries.html#develop-local-python

# Install dependencies (Maven, zip)
FROM maven:3.6-jdk-8 as build

# Install Python
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev zip unzip docker.io \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
RUN python --version

# Install Spark distribution provided by AWS for Glue development
RUN wget -qO- https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-1.0/spark-2.4.3-bin-hadoop2.8.tgz | tar zxf - 2>/dev/null
RUN mv spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8 spark
ENV SPARK_HOME /spark

# Install pytest and related libs
RUN pip install pytest pylint pytest-watch pytest-cov ipdb moto rootpath

# Install boto3, pyspark, and sci pkgs
RUN pip install boto3 findspark pyspark numpy sklearn scipy

RUN pytest --version
