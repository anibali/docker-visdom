
FROM python:3.6-jessie

# Install Visdom from PyPI
RUN pip install visdom==0.1.8.5
# Download scripts, styles, and fonts required by Visdom
RUN python -c "from visdom.server import download_scripts; download_scripts()"

ENV PORT=8097 \
    ENV_PATH="~/.visdom/" \
    LOGGING_LEVEL=INFO

EXPOSE $PORT

CMD python -m visdom.server -port ${PORT} -env_path ${ENV_PATH} -logging_level ${LOGGING_LEVEL}
