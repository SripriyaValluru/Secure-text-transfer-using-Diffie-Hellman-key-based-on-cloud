FROM python:3
RUN mkdir /
WORKDIR /capstone
COPY requirements.txt /capstone/
RUN pip install -r requirements.txt
COPY . /capstone/
