# api-template
A template for an API in python

## Requirements
- Install [Docker](https://docs.docker.com/get-docker/)
- (Linux only) Install [Docker Compose](https://docs.docker.com/compose/install/)

## Configuration
By default the image is built in "development mode". You can change to "production mode" by setting the appropriate value in the `TARGET_ENV` environment variable contained in the `.env` file.

**Note that** `TARGET_ENV` is required by `docker-compose.yml`

## Usage
* Use `make start` to run the service
    * You can find the [interactive api docs](https://fastapi.tiangolo.com/tutorial/first-steps/#interactive-api-docs) on http://localhost:8080/docs
    * There's also a jupyter notebook to play with on http://localhost:8888 (remember to `os.chdir("..)` from notebooks folder in order to import app packages)
      
      **Note that** you need a token to access the notebook. You can find it in yout container logs:
      ```    
      docker logs <container_id_or_name>
      ```
      Example:
      <pre>
      http://127.0.0.1:8888/?token=<b>89fca8197510f36fd4761107bd0bc9539a88ff6dd536b9b8</b>
      </pre>
      
* Use `make stop` to stop the service
