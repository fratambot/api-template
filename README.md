# api-template
A Dockerized template for a [FastApi](https://fastapi.tiangolo.com/) in python with a persistent [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/) service to play with :)

(Notice that Poetry is used only as a - great ! - dependency manager here. Virtualenvs creation is suppresed in order to avoid "isolation inception" inside Docker 😵‍💫 )

## Requirements
- Install [Docker](https://docs.docker.com/get-docker/)
- (Linux only) Install [Docker Compose](https://docs.docker.com/compose/install/)
- (Local development only) Install [Poetry](https://python-poetry.org/docs/#installation)

## Configuration
You have to set up the following environment variables in the `.env` file because thay are **required** by `docker-compose.yml`:

* `TARGET_ENV`: choose between `development` or `production`; in development mode additional deps will be installed in the image.
* `NOTEBOOKS_FOLDER`: put the **absolute path** to a folder on your machine where you want to retrieve and store the Jupyter notebooks you create and save in the docker notebooks folder.

## Project Structure
The project structure is a variation on [Kenneth Reitz recommendations](https://docs.python-guide.org/writing/structure/#sample-repository).

The bulk of your Python code should live in the `models` folder and you should use your notebooks as a fast and interactive way to explore and use your code. You can put static data in the `data` folder and your outputs (reporting, analysis, performances, etc..) in the `output` folder.

**Notice that** only the `notebooks` folder is mounted on a host path ! If you want your `output` folder to be persisent as well you should [add another volume](https://docs.docker.com/compose/compose-file/compose-file-v3/#volumes) to the notebook service in the `docker-compose.yml`

## Usage
* Use `make start` to run the service
    * You can find the [interactive api docs](https://fastapi.tiangolo.com/tutorial/first-steps/#interactive-api-docs) on http://localhost:8080/docs .
    * There's also a jupyter notebook to play with on http://localhost:8888 . The docker `notebooks` folder come with an example importing a module from a custom package.

* Use `make stop` to stop the service .

## Development

