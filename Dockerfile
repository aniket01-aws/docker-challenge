FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# Add a new user "john" with user id 8877
#RUN useradd -ms /bin/bash john
# Change to non-root privilege
#USER john

# We copy just the requirements.txt first to leverage Docker cache
RUN  useradd -ms /bin/bash dockeruser
USER dockeruser

WORKDIR /home/dockeruser
COPY ./ ./
RUN pip install -r requirements.txt
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]

