FROM python:3.7.2

ENV PYTHONUNBUFFERED 1
ENV PIPENV_VENV_IN_PROJECT 1
# 下記設定が pipenv には何やら無難な模様
# https://github.com/pypa/pipenv/issues/187
# ENV LC_ALL en_US.UTF-8
# ENV LANG en_US.UTF-8
# ENV LC_CTYPE UTF-8

RUN mkdir /code
WORKDIR /code
COPY . /code/

# RUN pip install numpy matplotlib && \
#   if [ -f requirements.txt ]; then pip install -r requirements.txt; else pip freeze > requirements.txt; fi
RUN pip install --upgrade pip && \
  pip install pipenv && \
  pipenv --python 3.7.2 && \
  pipenv install && \
  echo "[ ! -d /code/.venv ] && pipenv --python 3.7.2 && pipenv install" >> ~/.bashrc && \
  echo "pipenv --where && pipenv --venv && pipenv --py" >> ~/.bashrc


# pipenv install numpy matplotlib

# RUN pip install numpy matplotlib && \
#   if [ -f requirements.txt ]; then pip install -r requirements.txt; else pip freeze > requirements.txt; fi
# if [ -f requirements.txt ]; then echo "TRUE"; else echo "FALSE"; fi