FROM foundryai/spark-pytest:latest

WORKDIR /usr/src/app

ADD requirements.txt /usr/src/app
ADD requirements-dev.txt /usr/src/app

RUN pip install -r requirements.txt
RUN pip install -r requirements-dev.txt

COPY . /usr/src/app

CMD ["pytest"]
