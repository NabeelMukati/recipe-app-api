FROM python:3.9-alpine3.13
LABEL maintainer="NabeelMukati"

ENV PYTHONUNBBUFFERED 1



#copies the requirements.txt file into the docker image
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
#copies the app directory to /app
COPY ./app /app 
WORKDIR /app
EXPOSE 8000 

ARG DEV=false
#creates a virtual environment
RUN python -m venv /py && \
    #upgrades pip for the virtual env
    /py/bin/pip install --upgrade pip && \
    #install the requirements file 
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    #adds a new user in the docker image. user is allowed to do whatever 
    adduser \
        --disabled-password \
        --no-create-home \
        django-user


#updates the envrionment variable.
ENV PATH="/py/bin:$PATH"

USER django-user
