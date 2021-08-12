# api-template
A template for an API in python

## Requirements
- Install [Docker](https://docs.docker.com/get-docker/)
- (Linux only) Install [Docker Compose](https://docs.docker.com/compose/install/)

## Configuration
By default the image is built in "development mode". You can change to "production mode" by setting the appropriate value in the `TARGET_ENV` environment variable contained in the `.env` file.

**Note that** `TARGET_ENV` is required by `docker-compose.yml`

## Usage
- Use `make start` to run the service on http://localhost:8080 
  
  You can find the api doc under http://localhost:8080/docs

- Use `make stop` to stop the service
