# api-template
A template for an API in python

# Installation
You need to install poetry to install and use the api. Refer to the official guidelines here: https://python-poetry.org/docs/#installation

In order to update the dependencies (if needed) it is suggested to run from terminal:

    poetry install

# Poetry

You can use the makefile for all operations.

To open a notebook:

    make notebook

To run tests:

    make test

If you want to check the formatting of your code:

    make format
    
(It will launch a pre-commit hook including ``black`` and ``flake8``)

If you want to open a poetry shell which uses the virtual environment and all the dependencies:

    make shell
