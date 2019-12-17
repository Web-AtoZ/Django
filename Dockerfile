FROM python:3
LABEL maintainer="sunrise5318 <sunrise5318@gmail.com>"

# bashrc set (alias)
RUN { \
    echo '# alias'; \
    echo "alias dj='python /home/django/manage.py runserver 0:8100 && source ~/.bashrc';"; \
    } >> /root/.bashrc

RUN apt-get update && apt-get -y install \
    libpq-dev

RUN mkdir /home/django
WORKDIR /home/django
ADD    ./django/requirements.txt   /home/django
RUN    pip install -r requirements.txt

ADD    ./django/djangosample   /home/django/djangosample
ADD    ./django/manage.py      /home/django/

CMD ["python", "manage.py", "runserver", "0:8100"]
