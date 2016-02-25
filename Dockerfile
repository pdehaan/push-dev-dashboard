FROM python:2.7

RUN groupadd --gid 10001 app && \
    useradd --uid 10001 --gid 10001 --shell /usr/sbin/nologin app

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
RUN pip install --upgrade --no-cache-dir -r requirements.txt

COPY . /app

RUN chown -R app:app /app
USER app
EXPOSE 8000
CMD gunicorn dashboard.wsgi -b 0.0.0.0:${PORT:-8000} --log-file -
