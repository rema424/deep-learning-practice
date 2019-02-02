# deep-learning-practice

## Set up

### Python

[Python 3.7.2 - 2018-12-24 / Download macOS 64-bit installer](https://www.python.org/ftp/python/3.7.2/python-3.7.2-macosx10.9.pkg)

```bash
$ exec $SHELL -l

$ which python3
/Library/Frameworks/Python.framework/Versions/3.7/bin/python3

$ which pip3
/Library/Frameworks/Python.framework/Versions/3.7/bin/pip3

$ python3 --version
Python 3.7.2

$ pip3 --version
pip 18.1 from /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/pip (python 3.7)
```

### pipenv

```
$ pip3 install pipenv

$ echo 'export PIPENV_VENV_IN_PROJECT=true' >> ~/.bash_profile

$ exec $SHELL -l
```

### vscode

#### 拡張機能

`Python`をインストール

#### 設定ファイル

`.vscode/settings.json`

```json
{
  "python.venvFolders": [".venv", "envs", ".pyenv", ".direnv"],
  "python.pythonPath": "${workspaceFolder}/.venv/bin/python3",
  "python.autoComplete.extraPaths": ["${workspaceFolder}/.venv/lib/python3.7"]
}
```

### Docker

`Dockerfile`

```docker
FROM python:3.7.2

ENV PYTHONUNBUFFERED 1
ENV PIPENV_VENV_IN_PROJECT 1

RUN mkdir /code
WORKDIR /code
COPY . /code/

RUN pip install pipenv && \
  pipenv --python 3.7.2 && \
  pipenv install
```

`docker-compose.yml`

```yml
version: '3'

volumes:
  deep-learning-practice-volume:
    external: true

services:
  app:
    build: .
    working_dir: /code
    command: bash --login
    volumes:
      - .:/code
    environment:
      TZ: Asia/Tokyo
    ports:
      - 8080:8080
    tty: true
    privileged: true
```

`docker-sync.yml`

```yml
version: '2'

syncs:
  deep-learning-practice-volume:
    src: .
```

```bash
brew update
brew install pipenv
rm '/usr/local/bin/pipenv'
brew uninstall pipenv
brew install pipenv
echo 'export PIPENV_VENV_IN_PROJECT=1' >> ~/.bash_profile
echo '[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion' >> ~/.bash_profile
```

```
- aaa
    - aaaaa
        -
    - cccccccc
    - dddddddd
  - bbbbbbbbbb
  - cccccccccccc
    - dddddddddddddddd
    - bbbbbbbbbbbbbbb
```

- aaa
    - bbb
    - ccccc
