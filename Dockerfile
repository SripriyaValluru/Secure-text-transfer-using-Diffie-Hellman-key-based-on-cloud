FROM python:3
WORKDIR /code
ENV FLASK_RUN_HOST=127.0.0.1
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
#CMD python web-app/app.py
