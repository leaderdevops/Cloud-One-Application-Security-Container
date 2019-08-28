# Dockerfile

# Start with the latest python 2.x version
FROM python:2.7.13

# Build App
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY upstream/requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
COPY upstream/ /usr/src/app
COPY upstream/reset_db.sh /reset_db.sh
# Get the "built" version of runapp.sh
COPY upstream/runapp.sh /runapp.sh

# Initialize app database
RUN ["/reset_db.sh"]

# Add App Protect
RUN pip install https://download.immun.io/internal/python/immunio-3.1.2-cp26.cp27.cp33.cp34.cp35.cp36.cp37-none-manylinux1_x86_64.whl
# Note:  NO need for the following if passing environment variables via command line
#COPY immunio.ini /usr/src/app

# Override the original `wsgi.py` version with the IMMUNIO-ized version.
#COPY build/wsgi.py /usr/src/app/taskManager/wsgi.py

EXPOSE 8000

CMD ["/runapp.sh"]
