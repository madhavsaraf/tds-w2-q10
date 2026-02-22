FROM python:3.11-slim

RUN useradd -m -u 1000 user
USER user

ARG APP_PORT=7433
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH \
    APP_PORT=$APP_PORT

WORKDIR $HOME/app

COPY --chown=user requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=user . .

EXPOSE $APP_PORT
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${APP_PORT}"]
