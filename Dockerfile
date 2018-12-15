FROM ubuntu:latest
MAINTAINER Nikolay Antonov "nikolay.antonov.92@gmail.com"
RUN apt-get update -y
RUN apt-get install -y python-pip
RUN pip install flask pytz prometheus-client
COPY . /app
WORKDIR /app
ENTRYPOINT ["python"]
CMD ["app.py"]
