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
* `NOTEBOOKS_FOLDER`: put the **absolute path** to a folder on your machine where you want to retrieve and store the Jupyter notebooks you create and save in the docker `app\notebooks` folder.

## Project Structure
The project structure is a variation on [Kenneth Reitz recommendations](https://docs.python-guide.org/writing/structure/#sample-repository).

The bulk of your Python code should live in the `app\models` folder and you should use your notebooks as a fast and interactive way to explore and use your code. You can put static data in the `app\data` folder and your outputs (reporting, analysis, performances, etc..) in the `app\output` folder.

**Notice that** only the `app\notebooks` folder is mounted on a host path ! If you want your `app\output` folder to be persisent as well you should [add another volume](https://docs.docker.com/compose/compose-file/compose-file-v3/#volumes) to the notebook service in the `docker-compose.yml`

## Usage
* Use `make start` to run the service
    * You can find the [interactive api docs](https://fastapi.tiangolo.com/tutorial/first-steps/#interactive-api-docs) on http://localhost:8080/docs .
    * There's also a jupyter notebook to play with on http://localhost:8888 . The docker `app\notebooks` folder come with an example importing a module from a custom package.

* Use `make stop` to stop the service .

## Development
* Use `make test` to run the tests

* Use `make lint` to run formatting and lintering (black + pylint) from docker. **Notice thet** the source code won't be changed and the image will not be rebuilt ! This stage for now is more an "evaluation" on the code you used to build the image (see "Future developments" section).

## Local development
For local (actual !) development you need to [install Poetry](https://python-poetry.org/docs/#installation) on your machine and then from the `api-template` folder run:

    poetry install --no-root
    
A virtual environment with all the packages specified in the `pyproject.toml` file will be created.

* Use `poetry add <name_of_the_package>` if you want to [add a new package](https://python-poetry.org/docs/cli/#add) (use `--dev` if you want the package only in development mode). Poetry will automatically manage all the interdependencies 🤩 .

* You can use the script `make local-lint` to format and lint your code. **Notice that**, unlike the lint stage, black **will** reformat your code !

## Future developments

* The template is not properly configured for production yet. The production stage is just installing a subset of deps wrt the development stage. In production the whole app should not be copied. Also, in a CI/CD context the linting should happen as a pre-commit hook ([Husky + Lint staged ? Lefthook ?](https://dev.to/nitzano/linting-docker-containers-2lo6)) and the test stage should just trying to build and image and fail if tests are not passed (`RUN pytest -vv` instead of `CMD ["pytest", "-vv"]`).

* Maybe add a mongodb service ? It seems to me like a basic service for a data science api (e.g. if you have your data on some cloud storage service and you need to connect to)
