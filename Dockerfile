#FROM python:3.8

# Create app directory
#WORKDIR /app

# Install app dependencies
#COPY requirements.txt ./

#RUN pip install -r requirements.txt

# Bundle app source
#COPY . /web-app/app.py

#EXPOSE 5000
#CMD [ "python", "app.py" ]

FROM ubuntu:16.04

MAINTAINER Sri Priya Valluru "vallurus.priya@st.niituniversity.in"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

COPY ./requirements.txt /requirements.txt

RUN mkdir /usr/src/app/
COPY . /usr/src/app/
WORKDIR /usr/src/app/

#WORKDIR /

RUN pip3 install -r requirements.txt

#COPY . .

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
