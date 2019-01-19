FROM python:3.7.2

ENV PYTHONUNBUFFERED 1
ENV PIPENV_VENV_IN_PROJECT true

RUN mkdir /code
WORKDIR /code
COPY . /code/

RUN pip install pipenv && \
  pipenv --python 3.7.2 && \
  pipenv install numpy matplotlib

# RUN pip install numpy matplotlib && \
#   if [ -f requirements.txt ]; then pip install -r requirements.txt; else pip freeze > requirements.txt; fi
# if [ -f requirements.txt ]; then echo "TRUE"; else echo "FALSE"; fi
