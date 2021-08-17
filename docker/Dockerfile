#Dockerfile

# Build a base from tiangolo with all ENV and install and config poetry
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8 as base

WORKDIR /app

# python
ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# pip
ENV PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

# poetry
ENV POETRY_VERSION=1.0.0 \
    POETRY_HOME="/opt/poetry"

# Install Poetry respecting $POETRY_HOME & $POETRY_VERSION
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
# create link
RUN cd /usr/local/bin && ln -s /opt/poetry/bin/poetry
# deactivate venv creation
RUN poetry config virtualenvs.create false

# Copy using poetry.lock* in case it doesn't exist yet
# (we want these 2 files in every stage)
COPY ./pyproject.toml ./poetry.lock* /app/

# development stage install all dev deps
FROM base as development
ENV TARGET_ENV=development

WORKDIR /app
RUN poetry install --no-root

COPY ./app /app

# test stage runs all tests with pytest.
FROM development as test
COPY ./tests /tests
WORKDIR /tests
CMD ["pytest", "-vv"]

# lint stage runs black in --diff mode and pylint (see app/scripts/lint.sh)
FROM development as lint
COPY ./tests /tests
COPY ./scripts/lint.sh lint.sh
RUN chmod +x lint.sh
CMD sh lint.sh

# production stage install all non-dev deps
FROM base as production
ENV TARGET_ENV=production

WORKDIR /app
RUN poetry install --no-root --no-dev

COPY ./app /app