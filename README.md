# recipe-app-api
app which usees docker and Swagger API

## Docker setup:
requirements.txt: packages needed to run the software in both dev and production environments which tells the docker image what exactly to load and downlaod when starting the project.

requirements.dev.txt: what is needed in testing environments. In this case it's my unit testing software.

## .Flake8 file and docker ignore:
Docker Ignore: what docker should ignore when creating the image to load. 

Flake8 unit testing software in the file we specified specific software which you don't want it to test whether or not their are mistakes on it. 

