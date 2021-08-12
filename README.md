# api-template
A template for an API in python

## Configuration
By default the image is built as "development". You can change to "production" by setting the appropriate value in the `.env` file.
**Note that** `TARGET_ENV` is required by `docker-compose.yml`

## Usage

- Use `make start` to run the service on http://localhost:8080 
  You can find the api doc under http://localhost:8080/docs

- Use `make stop` to stop the service
