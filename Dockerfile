FROM python:3.8

# Create app directory
WORKDIR /app

# Install app dependencies
COPY requirements.txt ./

RUN pip install -r requirements.txt

# Bundle app source
COPY . /app/web-app

EXPOSE 5000
CMD [ "python", "/web-app/app.py" ]
