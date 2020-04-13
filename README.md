# spark-pytest
Dockerization of a pytest environment for tests that use Spark.

![CI Workflow](https://github.com/FoundryAI/spark-pytest/workflows/CI%20Workflow/badge.svg)

### Example Usage Steps

See the sample code in the `example/` directory and the workflow in `.github/workflows/ci.yml` for a bare-bones use case.

1. Create a Dockerfile within the repo to test
```
FROM foundryai/spark-pytest:latest

WORKDIR /usr/src/app

ADD requirements.txt /usr/src/app
ADD requirements-dev.txt /usr/src/app

RUN pip install -r requirements.txt
RUN pip install -r requirements-dev.txt

COPY . /usr/src/app

CMD ["pytest"]

```

2.) Build the latest Docker image of the source code. (See `docker-build` in `example/Makefile`.)

3.) Run the tests. (See `spark-pytest` in `example/Makefile`.)

(Note: running `make spark-pytest` in the `example/` directory will complete steps 2 and 3 at once.)


---
### Non-Dockerized setup steps
1. Install maven, run the `brew install maven` command. If you are not running on MacOS, see the manual install steps below.

### Prerequisites for Local PySpark Development
Complete these steps to prepare for local Python development:

1. Install Apache Maven from the following location: https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-common/apache-maven-3.6.0-bin.tar.gz.

2. Install the Apache Spark distribution the following location: https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-1.0/spark-2.4.3-bin-hadoop2.8.tgz 

3. Export the SPARK_HOME environment variable, setting it to the root location extracted from the Spark archive. For example:
    - `export SPARK_HOME=/home/$USER/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8`

### Running your tests

|Utility|Command|Description|
|---|---|---|
|Pytest|`./bin/pytest`|Write and run unit tests of your Python code. The pytest module must be installed and available in the PATH. For more information, see the pytest documentation.|

### References
[Developing and Testing ETL Scripts Locally Using the AWS Glue ETL Library](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-libraries.html)


---
[We're hiring!](https://foundry.ai/careers/)