FROM ubuntu:16.04
# Add a new user "john" with user id 8877
RUN useradd -u 8877 john
# Change to non-root privilege
USER john


RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

WORKDIR /webapps/devops/app

RUN pip install -r requirements.txt

COPY . /webapps/devops/app


CMD [ "python" , "app.py" ]
