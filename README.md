# api-template
A template for an API in python


# Docker

## Build
Use `make build` to build the image

## Run
Use `make start` to run the service on `localhost:8000` (**not working**)


# Poetry

You can use the makefile for all operations on local machine.
**TODO:** And from inside docker container ? 

To open a notebook:

    make notebook

To run tests:

    make test

If you want to check the formatting of your code:

    make format
    
(It will launch a pre-commit hook including ``black`` and ``flake8``)

If you want to open a poetry shell which uses the virtual environment and all the dependencies:

    make shell
