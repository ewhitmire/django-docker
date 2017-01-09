 FROM python:3.5
 ENV PYTHONUNBUFFERED 1
 RUN apt-get update && apt-get install -y \
     postgresql-client
 RUN mkdir /app
 WORKDIR /app
 ADD requirements.txt /app/
 RUN pip install -r requirements.txt
 ADD . /app