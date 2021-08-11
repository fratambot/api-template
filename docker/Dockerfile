#Dockerfile minimal

# Creating a fastapi base with shared environment variables
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

WORKDIR /app

    # python
ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

    # poetry
ENV POETRY_VERSION=1.0.0

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# because we are in docker folder
#WORKDIR /

# Copy using poetry.lock* in case it doesn't exist yet
COPY pyproject.toml poetry.lock* /app/

RUN poetry install --no-root --no-dev

COPY ./app /app