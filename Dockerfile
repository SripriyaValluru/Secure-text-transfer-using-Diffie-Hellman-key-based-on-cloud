FROM python:3
RUN mkdir /sample
WORKDIR /sample
COPY requirements.txt /sample/
RUN pip install -r requirements.txt
COPY . /sample/
