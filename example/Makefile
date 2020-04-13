help:
	@echo "build-job - package job"
	@echo "spark-pytest - run tests"

docker-build:
	@docker build \
		-t hello-alice-1.0:latest \
		.

spark-pytest: docker-build
	@docker run \
		-v $(PWD)/:/usr/src/app \
		-e AWS_REGION=us-east-1 \
		--name hello-alice-run-$$RANDOM \
		hello-alice-1.0:latest \
		pytest -s --cov=. --cov-report=xml --cov-config=.coveragerc /usr/src/app/test
