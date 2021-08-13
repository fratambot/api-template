# api-template
A Dockerized template for a [FastApi](https://fastapi.tiangolo.com/) in python with a persistent [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/) service to play with :)

## Requirements
- Install [Docker](https://docs.docker.com/get-docker/)
- (Linux only) Install [Docker Compose](https://docs.docker.com/compose/install/)

## Configuration
You have to set up the following environment variables in the `.env` file because thay are **required** by `docker-compose.yml`:

* `TARGET_ENV`: choose between `development` or `production`; in development mode additional deps will be installed in the image.
* `NOTEBOOKS_FOLDER`: put the **absolute path** to a folder on your machine where you want to retrieve and store the Jupyter notebooks you create and save in the docker notebooks folder.

## Usage
* Use `make start` to run the service
    * You can find the [interactive api docs](https://fastapi.tiangolo.com/tutorial/first-steps/#interactive-api-docs) on http://localhost:8080/docs
    * There's also a jupyter notebook to play with on http://localhost:8888 (remember to `os.chdir("..")` from notebooks folder in order to import app packages)

* Use `make stop` to stop the service
